# meli::RestClientApi

All URIs are relative to *https://api.mercadolibre.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**resource_get**](RestClientApi.md#resource_get) | **GET** /{resource} | Resource path GET
[**resource_post**](RestClientApi.md#resource_post) | **POST** /{resource} | Resourse path POST
[**resource_put**](RestClientApi.md#resource_put) | **PUT** /{resource} | Resourse path PUT



## resource_get

> resource_get(resource, access_token)

Resource path GET

### Example

```ruby
# load the gem
require 'meli'

api_instance = meli::RestClientApi.new
resource = 'resource_example' # String | 
access_token = 'access_token_example' # String | 

begin
  #Resource path GET
  api_instance.resource_get(resource, access_token)
rescue meli::ApiError => e
  puts "Exception when calling RestClientApi->resource_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resource** | **String**|  | 
 **access_token** | **String**|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## resource_post

> resource_post(resource, access_token, body)

Resourse path POST

### Example

```ruby
# load the gem
require 'meli'

api_instance = meli::RestClientApi.new
resource = 'resource_example' # String | 
access_token = 'access_token_example' # String | 
body = nil # Object | 

begin
  #Resourse path POST
  api_instance.resource_post(resource, access_token, body)
rescue meli::ApiError => e
  puts "Exception when calling RestClientApi->resource_post: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resource** | **String**|  | 
 **access_token** | **String**|  | 
 **body** | **Object**|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## resource_put

> resource_put(resource, access_token, body)

Resourse path PUT

### Example

```ruby
# load the gem
require 'meli'

api_instance = meli::RestClientApi.new
resource = 'resource_example' # String | 
access_token = 'access_token_example' # String | 
body = nil # Object | 

begin
  #Resourse path PUT
  api_instance.resource_put(resource, access_token, body)
rescue meli::ApiError => e
  puts "Exception when calling RestClientApi->resource_put: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resource** | **String**|  | 
 **access_token** | **String**|  | 
 **body** | **Object**|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

