#!/usr/bin/ruby

require 'rubygems'
require '../lib/meli'

meli = Meli.new(CLIENT_ID, CLIENT_SECRET, ACCESS_TOKEN, REFRESH_TOKEN)

body = {"title"=>"New Title", "price"=>1000}

response = meli.put("/items/#{ITEM_ID}", body, {:access_token => meli.access_token})

#Json format
puts response.body

#ruby hash format
res = JSON.parse response.body
puts res.inspect
