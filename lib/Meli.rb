require File.dirname(__FILE__) + "/meliSDK"
module MeliSDK
    class API

        include HTTPService

        def initialize(access_token = nil)
            @access_token = access_token
        end

        attr_reader :access_token

        def api(verb, path, options = {}, &error_checking_block)

            options["access_token"] = @access_token || @app_access_token if @access_token || @app_access_token

            # add a leading /
            path = "/#{path}" unless path =~ /^\//

            # make the request via the provided service
            result = MeliSDK.make_request(path, verb, options)

            if result.status.to_i >= 500
                raise MeliSDK::ServerError.new(result.status.to_i, result.body)
            end
        end #def

        def get(path, options = {}){
            api('GET', path, options);
        }

        def post(path, options = {}){
            api('POST', path, options);
        }

        def put(path, options = {}){
            api('PUT', path, options);
        }

        def delete(path, options = {}){
            api('DELETE', path, options);
        }

    end #class
end #module
