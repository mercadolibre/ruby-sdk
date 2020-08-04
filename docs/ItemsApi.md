# meli::ItemsApi

All URIs are relative to *https://api.mercadolibre.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**items_id_get**](ItemsApi.md#items_id_get) | **GET** /items/{id} | Return a Item.
[**items_id_put**](ItemsApi.md#items_id_put) | **PUT** /items/{id} | Update a Item.
[**items_post**](ItemsApi.md#items_post) | **POST** /items | Create a Item.



## items_id_get

> items_id_get(id)

Return a Item.

### Example

```ruby
# load the gem
require 'meli'

api_instance = meli::ItemsApi.new
id = 'id_example' # String | 

begin
  #Return a Item.
  api_instance.items_id_get(id)
rescue meli::ApiError => e
  puts "Exception when calling ItemsApi->items_id_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## items_id_put

> items_id_put(id, access_token, item)

Update a Item.

### Example

```ruby
# load the gem
require 'meli'

api_instance = meli::ItemsApi.new
id = 'id_example' # String | 
access_token = 'access_token_example' # String | 
item = meli::Item.new # Item | 

begin
  #Update a Item.
  api_instance.items_id_put(id, access_token, item)
rescue meli::ApiError => e
  puts "Exception when calling ItemsApi->items_id_put: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **access_token** | **String**|  | 
 **item** | [**Item**](Item.md)|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## items_post

> items_post(access_token, item)

Create a Item.

### Example

```ruby
# load the gem
require 'meli'

api_instance = meli::ItemsApi.new
access_token = 'access_token_example' # String | 
item = meli::Item.new # Item | 

begin
  #Create a Item.
  api_instance.items_post(access_token, item)
rescue meli::ApiError => e
  puts "Exception when calling ItemsApi->items_post: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **String**|  | 
 **item** | [**Item**](Item.md)|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined

