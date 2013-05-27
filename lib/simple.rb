require 'net/http'

class Meli
    attr_reader :access_token, :secret, :app_id, :refresh_token, :http

    SDK_VERSION = "MELI-RUBY-SDK-1.0.0"
    API_ROOT_URL = 'https://api.mercadolibre.com'
    AUTH_URL = 'https://auth.mercadolibre.com.ar/authorization'
    OAUTH_URL = '/oauth/token'

    #constructor
    def initialize(app_id = nil, secret = nil, access_token = nil)
        @access_token = access_token
        @app_id = app_id
        @secret = secret
        @http = Net::HTTP.new(API_ROOT_URL)
        @http['Accept'] = 'application/json'
        @http['Content-Type'] = 'application/json'
        @http['User-Agent'] = SDK_VERSION
    end

    #AUTH METHODS
    def auth_url(redirect_URI)
        params = {:client_id  => @app_id, :response_type => 'code', :red_uri => redirect_URI}
        url = "#{AUTH_URL}?#{to_url_params(params)}"
    end

    def authorize(code, redirect_URI):
        params = { :grant_type => @authorization_code, :client_id => @app_id, :secret => @secret, :code => code, :redirect_uri => redirect_URI}

        url = "#{OAUTH_URL}?#{to_url_params(params)}"

        response = requests('POST', url)

        if response.status_code == requests.codes.ok:
            resp_json = response.json()
            @access_token = resp_json['access_token']
            if resp_json.has_key('refresh_token'):
                @refresh_token = resp_json['refresh_token']
            else
                @refresh_token = '' # offline_access not set up
            end
        else
            response.raise_for_status()
        end
    end

    def refresh_token()
        if @refresh_token != ''
            params = {:grant_type => 'refresh_token', :client_id => @app_id, :client_secret => @secret, :refresh_token => @refresh_token}

            url = "#{OAUTH_URL}?#{to_url_params(params)}"

            response = requests('POST', url)

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
    def request(verb, path, params = {}, body)

        params["access_token"] = @access_token if params["access_token"]

        # Making Path and add a leading if not exist/
        path = "/#{path}" unless path =~ /^\//

        path = "#{path}?#{to_url_params(params)}" if params.keys.size > 0

        # make the request
        result = @http.send_request(verb, path, body)

    end

    def get(path, params = {})
        request('GET', path, params)
    end

    def post(path, params = {}, body)
        request('POST', path, params, body)
    end

    def put(path, params = {}, body)
        request('PUT', path, params, body)
    end

    def delete(path, params = {})
        request('DELETE', path, params)
    end

    def options(path, params = {})
        request('OPTIONS', path, params)
    end

private
    def to_url_params(params)
      URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
    end

end  #class
