require 'rubygems'
require 'net/http'
require 'net/https'
require 'json'

class Meli
    attr_accessor :access_token, :refresh_token
    attr_reader :secret, :app_id, :http

    SDK_VERSION = "MELI-RUBY-SDK-1.0.0"
    API_ROOT_URL = 'https://api.mercadolibre.com' #SHOULD NOT HAVE PREECEDING HTTP://
    AUTH_URL = 'auth.mercadolibre.com.ar/authorization'
    OAUTH_URL = '/oauth/token'

    #constructor
    def initialize(app_id = nil, secret = nil, access_token = nil, refresh_token = nil)
        @access_token = access_token
        @refresh_token = refresh_token
        @app_id = app_id
        @secret = secret
        api_url = URI.parse API_ROOT_URL
        @http = Net::HTTP.new(api_url.host, api_url.port)
        @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        @http.use_ssl = true
    end

    #AUTH METHODS
    def auth_url(redirect_URI)
        params = {:client_id  => @app_id, :response_type => 'code', :red_uri => redirect_URI}
        url = "http://#{AUTH_URL}?#{to_url_params(params)}"
    end

    def authorize(code, redirect_URI)
        params = { :grant_type => 'authorization_code', :client_id => @app_id, :client_secret => @secret, :code => code, :redirect_uri => redirect_URI}

        url = "#{API_ROOT_URL}#{OAUTH_URL}?#{to_url_params(params)}"

        response = execute("POST", url)

        case response
        when Net::HTTPSuccess
            response_info = JSON.parse response.body

            #convert hash keys to symbol
            Hash[response_info.map{ |k, v| [k.to_sym, v] }]

            @access_token = response_info[:access_token]
            if resp_json.has_key?(:refresh_token)
                @refresh_token = response_info[:refresh_token]
            else
                @refresh_token = '' # offline_access not set up
            end
            @access_token
        else
            # response code isn't a 200; raise an exception
            response.error!
        end

    end

    def refresh_token()
        if !@refresh_token.nil? ans !@refresh_token.empty?
            params = {:grant_type => 'refresh_token', :client_id => @app_id, :client_secret => @secret, :refresh_token => @refresh_token}

            url = "#{API_ROOT_URL}#{OAUTH_URL}?#{to_url_params(params)}"

            response = @http.send_request('POST', url)

            case response
            when Net::HTTPSuccess
                response_info = JSON.parse response.body

                #convert hash keys to symbol
                Hash[response_info.map{ |k, v| [k.to_sym, v] }]

                @access_token = response_info[:access_token]
                @refresh_token = response_info[:refresh_token]
            else
                # response code isn't a 200; raise an exception
                response.error!
            end
        else
            raise Exception, "Offline-Access is not allowed."
        end
    end

    #REQUEST METHODS
    def execute(verb, path, body = nil , params = {})

        params["access_token"] = @access_token if params["access_token"]

        # Making Path and add a leading / if not exist
        path = "/#{path}" unless path =~ /^\//
        path = "#{path}?#{to_url_params(params)}" if params.keys.size > 0
        path = "#{API_ROOT_URL}#{path}" unless path =~ /^http/

        uri = URI.parse path

        @http.start do |http|
            case verb
            when 'GET'
                req = Net::HTTP::Get.new(uri.path)
                req['Accept'] = 'application/json'
                req['User-Agent'] = SDK_VERSION
            when 'POST'
                req = Net::HTTP::Post.new(uri.path)
                req['Accept'] = 'application/json'
                req['Content-Type'] = 'application/json'
                req['User-Agent'] = SDK_VERSION
            when 'PUT'
                req = Net::HTTP::Put.new(uri.path)
                req['Accept'] = 'application/json'
                req['Content-Type'] = 'application/json'
                req['User-Agent'] = SDK_VERSION
            when 'DELETE'
                req = Net::HTTP::Delete.new(uri.path)
                req['Accept'] = 'application/json'
                req['User-Agent'] = SDK_VERSION
            when 'OPTIONS'
                req = Net::HTTP::Options.new(uri.path)
                req['Accept'] = 'application/json'
                req['User-Agent'] = SDK_VERSION
            end

            response = @http.request(req)

        end #do
    end #def execute

    def get(path, params = {})
        execute('GET', path, nil, params)
    end

    def post(path, body, params = {})
        execute('POST', path, body, params)
    end

    def put(path, body, params = {})
        execute('PUT', path, body, params)
    end

    def delete(path, params = {})
        execute('DELETE', path, nil, params)
    end

    def options(path, params = {})
        execute('OPTIONS', path, nil, params)
    end

private
    def to_url_params(params)
      URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
    end

end  #class
