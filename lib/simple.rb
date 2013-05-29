require 'net/http'
require 'net/https'

class Meli
    attr_accessor :access_token, :refresh_token
    attr_reader :secret, :app_id, :http

    SDK_VERSION = "MELI-RUBY-SDK-1.0.0"
    API_ROOT_URL = 'api.mercadolibre.com' #SHOULD NOT HAVE PREECEDING HTTP://
    AUTH_URL = 'auth.mercadolibre.com.ar/authorization'
    OAUTH_URL = '/oauth/token'

    #constructor
    def initialize(app_id = nil, secret = nil, access_token = nil)
        @access_token = access_token
        @app_id = app_id
        @secret = secret
        api_url = URI.parse "https://#{API_ROOT_URL}"
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

        STDERR.puts response.inspect

        if response.status_code == 200
            resp_json = response.json()
            @access_token = resp_json['access_token']
            if resp_json.has_key('refresh_token')
                @refresh_token = resp_json['refresh_token']
            else
                @refresh_token = '' # offline_access not set up
            end
        else
            response
        end
    end

    def refresh_token()
        if @refresh_token != ''
            params = {:grant_type => 'refresh_token', :client_id => @app_id, :client_secret => @secret, :refresh_token => @refresh_token}

            url = "#{OAUTH_URL}?#{to_url_params(params)}"

            response = @http.send_request('POST', url)

            if response.status_code == requests.codes.ok
                resp_json = response.json()
                @access_token = resp_json['access_token']
                @refesh_token = resp_json['refresh_token']
            else
                response.raise_for_status()
            end
        else
            raise Exception, "Offline-Access is not allowed."
        end
    end

    #REQUEST METHODS
    def execute(verb, path, body = nil , params = {})

        params["access_token"] = @access_token if params["access_token"]

        # Making Path and add a leading if not exist/
        path = "/#{path}" unless path =~ /^\//

        path = "https://#{API_ROOT_URL}#{path}?#{to_url_params(params)}" if params.keys.size > 0

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
