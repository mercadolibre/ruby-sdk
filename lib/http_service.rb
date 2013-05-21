require 'rest_client'
module MeliSDK
    module HTTPService
        class << self
            attr_accessor :http_options, :meli_api, :access_token
        end

        MELIAPIURL = 'https://api.mercadolibre.com/'

        @http_options ||= {}

        @meli_api = RestClient::Resource.new MELIAPIURL

        def self.make_request(verb, path, options = {})

            request_options = {:params => (verb == "get" ? params : {})}.merge(http_options || {}).merge(options)
            request_options[:use_ssl] = true if options["access_token"] # require https if there's a token
            if request_options[:use_ssl]
                ssl = (request_options[:ssl] ||= {})

                ssl[:verify] = true unless ssl.has_key?(:verify)
            end

            response = RestClient.send(verb, path, (verb == "post" ? params : {}))
        end

        def self.make_request_with_token(verb, path, options = {})
            options['access_token'] << access_token
            make_request(verb, path, options)
        end

        def self.encode_params(param_hash)
            ((param_hash || {}).sort_by{|k, v| k.to_s}.collect do |key_and_value|
                key_and_value[1] = MultiJson.dump(key_and_value[1]) unless key_and_value[1].is_a? String
                "#{key_and_value[0].to_s}=#{CGI.escape key_and_value[1]}"
            end).join("&")
        end

        #This Helpers have educational proporses, this can be build using meta programming using method missing
        def orders
            RestClient::Resource.new 'https://api.mercadolibre.com/orders'
        end

        def items
            RestClient::Resource.new 'https://api.mercadolibre.com/items'
        end

        def sites
            RestClient::Resource.new 'https://api.mercadolibre.com/sites'
        end

        def questions
            RestClient::Resource.new 'https://api.mercadolibre.com/questions'
        end

        def shipments
            RestClient::Resource.new 'https://api.mercadolibre.com/shipments'
        end

        def categories
            RestClient::Resource.new 'https://api.mercadolibre.com/categories'
        end

    end
end
