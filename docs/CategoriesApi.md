# Meli::CategoriesApi

All URIs are relative to *https://api.mercadolibre.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**categories_category_id_get**](CategoriesApi.md#categories_category_id_get) | **GET** /categories/{category_id} | Return by category.
[**sites_site_id_categories_get**](CategoriesApi.md#sites_site_id_categories_get) | **GET** /sites/{site_id}/categories | Return a categories by site.
[**sites_site_id_domain_discovery_search_get**](CategoriesApi.md#sites_site_id_domain_discovery_search_get) | **GET** /sites/{site_id}/domain_discovery/search | Predictor



## categories_category_id_get

> Object categories_category_id_get(category_id)

Return by category.

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::CategoriesApi.new
category_id = 'category_id_example' # String | 

begin
  #Return by category.
  result = api_instance.categories_category_id_get(category_id)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling CategoriesApi->categories_category_id_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category_id** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## sites_site_id_categories_get

> Object sites_site_id_categories_get(site_id)

Return a categories by site.

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::CategoriesApi.new
site_id = 'site_id_example' # String | 

begin
  #Return a categories by site.
  result = api_instance.sites_site_id_categories_get(site_id)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling CategoriesApi->sites_site_id_categories_get: #{e}"
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


## sites_site_id_domain_discovery_search_get

> Object sites_site_id_domain_discovery_search_get(site_id, q, limit)

Predictor

### Example

```ruby
# load the gem
require 'Meli'

api_instance = Meli::CategoriesApi.new
site_id = 'site_id_example' # String | 
q = 'q_example' # String | 
limit = 'limit_example' # String | 

begin
  #Predictor
  result = api_instance.sites_site_id_domain_discovery_search_get(site_id, q, limit)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling CategoriesApi->sites_site_id_domain_discovery_search_get: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **site_id** | **String**|  | 
 **q** | **String**|  | 
 **limit** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

