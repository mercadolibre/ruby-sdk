# Meli::RestClientApi

All URIs are relative to *https://api.mercadolibre.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**resource_delete**](RestClientApi.md#resource_delete) | **DELETE** /{resource} | Resource path DELETE
[**resource_get**](RestClientApi.md#resource_get) | **GET** /{resource} | Resource path GET
[**resource_post**](RestClientApi.md#resource_post) | **POST** /{resource} | Resourse path POST
[**resource_put**](RestClientApi.md#resource_put) | **PUT** /{resource} | Resourse path PUT



## resource_delete

> Object resource_delete(resource, access_token)

Resource path DELETE

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::RestClientApi.new
resource = 'resource_example' # String | 
access_token = 'access_token_example' # String | 

begin
  #Resource path DELETE
  result = api_instance.resource_delete(resource, access_token)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling RestClientApi->resource_delete: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resource** | **String**|  | 
 **access_token** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## resource_get

> Object resource_get(resource, access_token)

Resource path GET

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::RestClientApi.new
resource = 'resource_example' # String | 
access_token = 'access_token_example' # String | 

begin
  #Resource path GET
  result = api_instance.resource_get(resource, access_token)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling RestClientApi->resource_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resource** | **String**|  | 
 **access_token** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## resource_post

> Object resource_post(resource, access_token, body)

Resourse path POST

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::RestClientApi.new
resource = 'resource_example' # String | 
access_token = 'access_token_example' # String | 
body = nil # Object | 

begin
  #Resourse path POST
  result = api_instance.resource_post(resource, access_token, body)
  p result
rescue Meli::ApiError => e
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

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## resource_put

> Object resource_put(resource, access_token, body)

Resourse path PUT

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::RestClientApi.new
resource = 'resource_example' # String | 
access_token = 'access_token_example' # String | 
body = nil # Object | 

begin
  #Resourse path PUT
  result = api_instance.resource_put(resource, access_token, body)
  p result
rescue Meli::ApiError => e
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

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

