#require 'http_service'

require File.dirname(__FILE__) + "/http_service"

module MeliSDK
    class << self
        attr_accessor :http_service, :access_token
    end

    def self.http_service=(service)
        @http_service = service
    end

    def self.make_request(verb, path, options = {})
        http_service.make_request(path, verb, options)
    end

    self.http_service = HTTPService
    http_service.access_token = access_token
end
