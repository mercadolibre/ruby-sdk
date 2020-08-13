# Meli::Attributes

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**name** | **String** |  | [optional] 
**value_id** | **String** |  | [optional] 
**value_name** | **String** |  | [optional] 
**value_struct** | [**AttributesValueStruct**](AttributesValueStruct.md) |  | [optional] 
**values** | [**Array&lt;AttributesValues&gt;**](AttributesValues.md) |  | [optional] 
**attribute_group_id** | **String** |  | [optional] 
**attribute_group_name** | **String** |  | [optional] 

## Code Sample

```ruby
require 'Meli'

instance = Meli::Attributes.new(id: DATA_STORAGE_CAPACITY,
                                 name: Capacidad de almacenamiento de datos,
                                 value_id: null,
                                 value_name: 8 GB,
                                 value_struct: null,
                                 values: null,
                                 attribute_group_id: OTHERS,
                                 attribute_group_name: Otros)
```


