# OpenSSL and Base64 are required to support signed_request
require 'openssl'
require 'base64'

module MeliSDK

    DIALOG_HOST = "api.mercadolibre.com"

    class OAuth
      attr_reader :app_id, :app_secret, :oauth_callback_url

      # Creates a new OAuth client.
      #
      # @param app_id [String, Integer]
      # @param app_secret
      # @param oauth_callback_url the URL in your app to which users authenticating with OAuth will be sent
      def initialize(app_id, app_secret, oauth_callback_url = nil)
        @app_id = app_id
        @app_secret = app_secret
        @oauth_callback_url = oauth_callback_url
      end

      #
      # @return the authenticated user's information as a hash, or nil.
      def get_user_info_from_cookies(cookie_hash)
        if signed_cookie = cookie_hash["meli_#{@app_id}"]
          parse_signed_cookie(signed_cookie)
        elsif unsigned_cookie = cookie_hash["meli_#{@app_id}"]
          parse_unsigned_cookie(unsigned_cookie)
        end
      end
      alias_method :get_user_info_from_cookie, :get_user_info_from_cookies

      # @note (see #get_user_info_from_cookie)
      #
      # @param (see #get_user_info_from_cookie)
      #
      # @return the authenticated user's
      def get_user_from_cookies(cookies)
        if signed_cookie = cookies["meli_#{@app_id}"]
          if components = parse_signed_request(signed_cookie)
            components["user_id"]
          end
        elsif info = get_user_info_from_cookies(cookies)
          # Parsing unsigned cookie
          info["uid"]
        end
      end
      alias_method :get_user_from_cookie, :get_user_from_cookies

      # URLs

      # Builds an OAuth URL, where users will be prompted to log in and for any desired permissions.
      # When the users log in, you receive a callback with their
      #
      # @param options any query values to add to the URL, as well as any special/required values listed below.
      # @option options permissions an array or comma-separated string of desired permissions
      #
      # @raise ArgumentError if no OAuth callback was specified in OAuth#new or in options as :redirect_uri
      #
      # @return an OAuth URL you can send your users to
      def url_for_oauth_code(options = {})
        if permissions = options.delete(:permissions)
          options[:scope] = permissions.is_a?(Array) ? permissions.join(",") : permissions
        end
        url_options = {:client_id => @app_id}.merge(options)

        # Creates the URL for oauth authorization for a given callback and optional set of permissions
        build_url("https://#{DIALOG_HOST}/authorization", true, url_options)
      end

      #
      # @see #url_for_oauth_code
      #
      # @note (see #url_for_oauth_code)
      #
      # @param code an OAuth code
      # @param options any additional query parameters to add to the URL
      #
      # @raise (see #url_for_oauth_code)
      #
      # @return an URL your server can query for the user's access token
      def url_for_access_token(code, options = {})
        # Creates the URL for the token corresponding to a given code
        url_options = {
          :client_id => @app_id,
          :code => code,
          :client_secret => @app_secret
        }.merge(options)
        build_url("https://#{GRAPH_SERVER}/oauth/access_token", true, url_options)
      end

      # @note (see #url_for_oauth_code)
      #
      # @param dialog_type
      # @param options any additional query parameters to add to the URL
      #
      # @return an URL your server can query for the user's access token
      def url_for_dialog(dialog_type, options = {})
        # some endpoints require app_id, some client_id, supply both doesn't seem to hurt
        url_options = {:app_id => @app_id, :client_id => @app_id}.merge(options)
        build_url("http://#{DIALOG_HOST}/dialog/#{dialog_type}", true, url_options)
      end

      # access tokens

      # Fetches an access token, token expiration
      # Useful when you've received an OAuth code using the server-side authentication process.
      # @param options any additional parameters to send when redeeming the token
      #
      # @raise Meli::OAuthTokenRequestError if returns an error response
      #
      # @return a hash of the access token info returned (token, expiration, etc.)
      def get_access_token_info(code, options = {})
        # should this require an OAuth callback URL?
        get_token_from_server({:code => code, :redirect_uri => options[:redirect_uri] || @oauth_callback_url}, false, options)
      end


      # @note (see #url_for_oauth_code)
      #
      # @param (see #get_access_token_info)
      #
      # @raise (see #get_access_token_info)
      #
      # @return the access token
      def get_access_token(code, options = {})
        # upstream methods will throw errors if needed
        if info = get_access_token_info(code, options)
          string = info["access_token"]
        end
      end

      #
      # @param options any additional parameters to send  when redeeming the token
      #
      # @return the application access token and other information (expiration, etc.)
      def get_app_access_token_info(options = {})
        # convenience method to get a the application's sessionless access token
        get_token_from_server({:grant_type => 'client_credentials'}, true, options)
      end

      #
      # @return the application access token
      def get_app_access_token(options = {})
        if info = get_app_access_token_info(options)
          string = info["access_token"]
        end
      end


      # @param access_token the access token to exchange
      # @param options any additional parameters to send  when exchanging tokens.
      #
      # @return the access token with extended expiration time and other information (expiration, etc.)
      def exchange_access_token_info(access_token, options = {})
        get_token_from_server({
          :grant_type => 'meli_exchange_token',
          :meli_exchange_token => access_token
        }, true, options)
      end

      # Fetches an access token with extended expiration time (ignoring expiration and other info).

      # @see exchange_access_token_info
      #
      # @param (see #exchange_access_token_info)
      def exchange_access_token(access_token, options = {})
        if info = exchange_access_token_info(access_token, options)
          info["access_token"]
        end
      end

      #
      # @raise OAuthSignatureError if the signature is incomplete, invalid, or using an unsupported algorithm
      #
      # @return a hash of the validated request information
      def parse_signed_request(input)
        encoded_sig, encoded_envelope = input.split('.', 2)
        raise OAuthSignatureError, 'Invalid (incomplete) signature data' unless encoded_sig && encoded_envelope

        signature = base64_url_decode(encoded_sig).unpack("H*").first
        envelope = MultiJson.load(base64_url_decode(encoded_envelope))

        raise OAuthSignatureError, "Unsupported algorithm #{envelope['algorithm']}" if envelope['algorithm'] != 'HMAC-SHA256'

        # now see if the signature is valid (digest, key, data)
        hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA256.new, @app_secret, encoded_envelope)
        raise OAuthSignatureError, 'Invalid signature' if (signature != hmac)

        envelope
      end

      protected

      def get_token_from_server(args, post = false, options = {})
        # fetch the result
        response = fetch_token_string(args, post, "access_token", options)
        parse_access_token(response)
      end

      def parse_access_token(response_text)
        components = response_text.split("&").inject({}) do |hash, bit|
          key, value = bit.split("=")
          hash.merge!(key => value)
        end
        components
      end

      def parse_unsigned_cookie(meli_cookie)
        # remove the opening/closing quote
        meli_cookie = meli_cookie.gsub(/\"/, "")

        components = {}
        meli_cookie.split("&").map {|param| param = param.split("="); components[param[0]] = param[1]}

        auth_string = components.keys.sort.collect {|a| a == "sig" ? nil : "#{a}=#{components[a]}"}.reject {|a| a.nil?}.join("")
        sig = Digest::MD5.hexdigest(auth_string + @app_secret)
        sig == components["sig"] && (components["expires"] == "0" || Time.now.to_i < components["expires"].to_i) ? components : nil
      end

      def parse_signed_cookie(meli_cookie)
        components = parse_signed_request(meli_cookie)
        if code = components["code"]
          begin
            token_info = get_access_token_info(code, :redirect_uri => '')
          rescue Meli::OAuthTokenRequestError => err
            if err.meli_error_type == 'OAuthException' && err.meli_error_message =~ /Code was invalid or expired/
              return nil
            else
              raise
            end
          end

          components.merge(token_info) if token_info
        else
          nil
        end
      end

      def fetch_token_string(args, post = false, endpoint = "access_token", options = {})
        response = Meli.make_request("/oauth/#{endpoint}", {
          :client_id => @app_id,
          :client_secret => @app_secret
        }.merge!(args), post ? "post" : "get", {:use_ssl => true}.merge!(options))

        raise ServerError.new(response.status, response.body) if response.status >= 500
        raise OAuthTokenRequestError.new(response.status, response.body) if response.status >= 400

        response.body
      end

      # base 64
      def base64_url_decode(str)
        str += '=' * (4 - str.length.modulo(4))
        Base64.decode64(str.tr('-_', '+/'))
      end

      def build_url(base, require_redirect_uri = false, url_options = {})
        if require_redirect_uri && !(url_options[:redirect_uri] ||= url_options.delete(:callback) || @oauth_callback_url)
          raise ArgumentError, "build_url must get a callback either from the OAuth object or in the parameters!"
        end

        "#{base}?#{Meli::HTTPService.encode_params(url_options)}"
      end
    end

end
