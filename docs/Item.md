# Meli::Item

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**title** | **String** |  | 
**category_id** | **String** |  | 
**price** | **Integer** |  | 
**currency_id** | **String** |  | 
**available_quantity** | **String** |  | 
**buying_mode** | **String** |  | 
**listing_type_id** | **String** |  | 
**condition** | **String** |  | 
**description** | **String** |  | 
**video_id** | **String** |  | 
**pictures** | [**Array&lt;ItemPictures&gt;**](ItemPictures.md) |  | 
**attributes** | [**Array&lt;Attributes&gt;**](Attributes.md) |  | [optional] 
**variations** | [**Array&lt;Variations&gt;**](Variations.md) |  | [optional] 

## Code Sample

```ruby
require 'Meli'

instance = Meli::Item.new(title: Item de test - No Ofertar,
                                 category_id: MLA5991,
                                 price: 350,
                                 currency_id: ARS,
                                 available_quantity: 12,
                                 buying_mode: buy_it_now,
                                 listing_type_id: bronze,
                                 condition: new,
                                 description: Item de Teste. Mercado Livre SDK,
                                 video_id: RXWn6kftTHY,
                                 pictures: null,
                                 attributes: null,
                                 variations: null)
```


