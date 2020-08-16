# Meli::ItemsHealthApi

All URIs are relative to *https://api.mercadolibre.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**items_id_health_actions_get**](ItemsHealthApi.md#items_id_health_actions_get) | **GET** /items/{id}/health/actions | Return item health actions by id.
[**items_id_health_get**](ItemsHealthApi.md#items_id_health_get) | **GET** /items/{id}/health | Return health by id.
[**sites_site_id_health_levels_get**](ItemsHealthApi.md#sites_site_id_health_levels_get) | **GET** /sites/{site_id}/health_levels | Return health levels.



## items_id_health_actions_get

> Object items_id_health_actions_get(id, access_token)

Return item health actions by id.

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::ItemsHealthApi.new
id = 'id_example' # String | 
access_token = 'access_token_example' # String | 

begin
  #Return item health actions by id.
  result = api_instance.items_id_health_actions_get(id, access_token)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling ItemsHealthApi->items_id_health_actions_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **access_token** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## items_id_health_get

> Object items_id_health_get(id, access_token)

Return health by id.

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::ItemsHealthApi.new
id = 'id_example' # String | 
access_token = 'access_token_example' # String | 

begin
  #Return health by id.
  result = api_instance.items_id_health_get(id, access_token)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling ItemsHealthApi->items_id_health_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **access_token** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## sites_site_id_health_levels_get

> Object sites_site_id_health_levels_get(site_id)

Return health levels.

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::ItemsHealthApi.new
site_id = 'site_id_example' # String | 

begin
  #Return health levels.
  result = api_instance.sites_site_id_health_levels_get(site_id)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling ItemsHealthApi->sites_site_id_health_levels_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

