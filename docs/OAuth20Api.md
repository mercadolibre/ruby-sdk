# Meli::OAuth20Api

All URIs are relative to *https://api.mercadolibre.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**auth**](OAuth20Api.md#auth) | **GET** /authorization | Authentication Endpoint
[**get_token**](OAuth20Api.md#get_token) | **POST** /oauth/token | Request Access Token



## auth

> auth(response_type, client_id, redirect_uri)

Authentication Endpoint

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::OAuth20Api.new
response_type = 'code' # String | 
client_id = 'client_id_example' # String | 
redirect_uri = 'redirect_uri_example' # String | 

begin
  #Authentication Endpoint
  api_instance.auth(response_type, client_id, redirect_uri)
rescue Meli::ApiError => e
  puts "Exception when calling OAuth20Api->auth: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **response_type** | **String**|  | [default to &#39;code&#39;]
 **client_id** | **String**|  | 
 **redirect_uri** | **String**|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_token

> Object get_token(opts)

Request Access Token

Partner makes a request to the token endpoint by adding the following parameters described below

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::OAuth20Api.new
opts = {
  grant_type: 'grant_type_example', # String | 
  client_id: 'client_id_example', # String | 
  client_secret: 'client_secret_example', # String | 
  redirect_uri: 'redirect_uri_example', # String | 
  code: 'code_example', # String | 
  refresh_token: 'refresh_token_example' # String | 
}

begin
  #Request Access Token
  result = api_instance.get_token(opts)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling OAuth20Api->get_token: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **grant_type** | **String**|  | [optional] 
 **client_id** | **String**|  | [optional] 
 **client_secret** | **String**|  | [optional] 
 **redirect_uri** | **String**|  | [optional] 
 **code** | **String**|  | [optional] 
 **refresh_token** | **String**|  | [optional] 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/x-www-form-urlencoded
- **Accept**: application/json

