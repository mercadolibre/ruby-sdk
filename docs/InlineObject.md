# Meli::InlineObject

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**grant_type** | **String** |  | [optional] 
**client_id** | **String** |  | [optional] 
**client_secret** | **String** |  | [optional] 
**redirect_uri** | **String** |  | [optional] 
**code** | **String** |  | [optional] 
**refresh_token** | **String** |  | [optional] 

## Code Sample

```ruby
require 'Meli'

instance = Meli::InlineObject.new(grant_type: authorization_code,
                                 client_id: null,
                                 client_secret: null,
                                 redirect_uri: null,
                                 code: null,
                                 refresh_token: null)
```


