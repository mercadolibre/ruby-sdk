# Meli::Variations

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**price** | **Integer** |  | [optional] 
**attribute_combinations** | [**Array&lt;VariationsAttributeCombinations&gt;**](VariationsAttributeCombinations.md) |  | [optional] 
**available_quantity** | **Integer** |  | [optional] 
**sold_quantity** | **Integer** |  | [optional] 
**picture_ids** | **Array&lt;String&gt;** |  | [optional] 

## Code Sample

```ruby
require 'Meli'

instance = Meli::Variations.new(price: 350,
                                 attribute_combinations: null,
                                 available_quantity: 2,
                                 sold_quantity: 0,
                                 picture_ids: null)
```


