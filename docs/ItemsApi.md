# Meli::ItemsApi

All URIs are relative to *https://api.mercadolibre.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**items_id_get**](ItemsApi.md#items_id_get) | **GET** /items/{id} | Return a Item.
[**items_id_put**](ItemsApi.md#items_id_put) | **PUT** /items/{id} | Update a Item.
[**items_post**](ItemsApi.md#items_post) | **POST** /items | Create a Item.



## items_id_get

> Object items_id_get(id)

Return a Item.

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::ItemsApi.new
id = 'id_example' # String | 

begin
  #Return a Item.
  result = api_instance.items_id_get(id)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling ItemsApi->items_id_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## items_id_put

> Object items_id_put(id, access_token, item)

Update a Item.

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::ItemsApi.new
id = 'id_example' # String | 
access_token = 'access_token_example' # String | 
item = Meli::Item.new # Item | 

begin
  #Update a Item.
  result = api_instance.items_id_put(id, access_token, item)
  p result
rescue Meli::ApiError => e
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

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## items_post

> Object items_post(access_token, item)

Create a Item.

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::ItemsApi.new
access_token = 'access_token_example' # String | 
item = Meli::Item.new # Item | 

begin
  #Create a Item.
  result = api_instance.items_post(access_token, item)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling ItemsApi->items_post: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **access_token** | **String**|  | 
 **item** | [**Item**](Item.md)|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

