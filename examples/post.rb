#!/usr/bin/ruby

require 'rubygems'
require 'bundler/setup'
require 'meli'

meli = Meli.new(CLIENT_ID, CLIENT_SECRET, ACCESS_TOKEN, REFRESH_TOKEN)

body = { 'condition' => 'new',
    'warranty' => '60 dias',
    'currency_id' => 'BRL',
    'accepts_mercadopago' => true,
    'description' => 'Lindo Ray_Ban_Original_Wayfarer',
    'listing_type_id' => 'bronze',
    'title' => "\303\223culos Ray Ban Aviador  Que Troca As Lentes  Lan\303\247amento!",
    'available_quantity' => 64,
    'price' => 289,
    'subtitle' => 'Acompanha 3 Pares De Lentes!! Compra 100% Segura',
    'buying_mode' => 'buy_it_now',
    'category_id' => 'MLB5125',
    'pictures'=>[{'source' => "http://upload.wikimedia.org/wikipedia/commons/f/fd/Ray_Ban_Original_Wayfarer.jpg"},
                {'source'=>'http://en.wikipedia.org/wiki/File:Teashades.gif'}]
}

response = meli.post("/items", body, {:access_token => meli.access_token})

# Json format
puts response.body

# ruby hash format
res = JSON.parse response.body
puts res.inspect
