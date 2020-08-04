=begin
#MELI Markeplace SDK

#This is a the codebase to generate a SDK for Open Platform Marketplace

The version of the OpenAPI document: 3.0.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'cgi'

module meli
  class OAuth20Api
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Authentication Endpoint
    # @param response_type [String] 
    # @param client_id [String] 
    # @param redirect_uri [String] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def auth(response_type, client_id, redirect_uri, opts = {})
      auth_with_http_info(response_type, client_id, redirect_uri, opts)
      nil
    end

    # Authentication Endpoint
    # @param response_type [String] 
    # @param client_id [String] 
    # @param redirect_uri [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def auth_with_http_info(response_type, client_id, redirect_uri, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OAuth20Api.auth ...'
      end
      # verify the required parameter 'response_type' is set
      if @api_client.config.client_side_validation && response_type.nil?
        fail ArgumentError, "Missing the required parameter 'response_type' when calling OAuth20Api.auth"
      end
      # verify enum value
      allowable_values = ["code"]
      if @api_client.config.client_side_validation && !allowable_values.include?(response_type)
        fail ArgumentError, "invalid value for \"response_type\", must be one of #{allowable_values}"
      end
      # verify the required parameter 'client_id' is set
      if @api_client.config.client_side_validation && client_id.nil?
        fail ArgumentError, "Missing the required parameter 'client_id' when calling OAuth20Api.auth"
      end
      # verify the required parameter 'redirect_uri' is set
      if @api_client.config.client_side_validation && redirect_uri.nil?
        fail ArgumentError, "Missing the required parameter 'redirect_uri' when calling OAuth20Api.auth"
      end
      # resource path
      local_var_path = '/authorization'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'response_type'] = response_type
      query_params[:'client_id'] = client_id
      query_params[:'redirect_uri'] = redirect_uri

      # header parameters
      header_params = opts[:header_params] || {}

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] 

      # auth_names
      auth_names = opts[:auth_names] || []

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OAuth20Api#auth\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Request Access Token
    # Partner makes a request to the token endpoint by adding the following parameters described below
    # @param [Hash] opts the optional parameters
    # @option opts [String] :grant_type 
    # @option opts [String] :client_id 
    # @option opts [String] :client_secret 
    # @option opts [String] :redirect_uri 
    # @option opts [String] :code 
    # @option opts [String] :refresh_token 
    # @return [nil]
    def get_token(opts = {})
      get_token_with_http_info(opts)
      nil
    end

    # Request Access Token
    # Partner makes a request to the token endpoint by adding the following parameters described below
    # @param [Hash] opts the optional parameters
    # @option opts [String] :grant_type 
    # @option opts [String] :client_id 
    # @option opts [String] :client_secret 
    # @option opts [String] :redirect_uri 
    # @option opts [String] :code 
    # @option opts [String] :refresh_token 
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def get_token_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: OAuth20Api.get_token ...'
      end
      # resource path
      local_var_path = '/oauth/token'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/x-www-form-urlencoded'])

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['grant_type'] = opts[:'grant_type'] if !opts[:'grant_type'].nil?
      form_params['client_id'] = opts[:'client_id'] if !opts[:'client_id'].nil?
      form_params['client_secret'] = opts[:'client_secret'] if !opts[:'client_secret'].nil?
      form_params['redirect_uri'] = opts[:'redirect_uri'] if !opts[:'redirect_uri'].nil?
      form_params['code'] = opts[:'code'] if !opts[:'code'].nil?
      form_params['refresh_token'] = opts[:'refresh_token'] if !opts[:'refresh_token'].nil?

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] 

      # auth_names
      auth_names = opts[:auth_names] || []

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: OAuth20Api#get_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
