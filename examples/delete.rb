#!/usr/bin/ruby

require 'rubygems'
require 'bundler/setup'
require 'meli'
require 'json'

meli = Meli.new(CLIENT_ID, CLIENT_SECRET, ACCESS_TOKEN, REFRESH_TOKEN)

response = meli.delete(
  '/questions/QUESTION_ID',
  access_token: meli.access_token
)

# Json format
puts response.body

# ruby hash format
res = JSON.parse response.body
puts res.inspect
