#!/usr/bin/ruby

require 'rubygems'
require '../lib/meli'
require 'json'

meli = Meli.new(CLIENT_ID, CLIENT_SECRET, ACCESS_TOKEN, REFRESH_TOKEN)

response = meli.get("/items/MLB488622999")

#Json format
puts response.body

#ruby hash format
res = JSON.parse response.body
puts res.inspect
