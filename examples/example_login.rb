require "rubygems"
require 'lib/meli'
require 'sinatra'
require 'json'

set :meli, Meli.new(CLIENT_ID, CLIENT_SECRET, ACCESS_TOKEN, REFRESH_TOKEN)
disable :reload

get '/authorize' do
    content_type :text
    settings.meli.authorize(params["code"], CALLBACK_URI) if params["code"]
    #Don't Forget to Save this data!
    "SUCESS! Token: #{settings.meli.access_token} RefresToken: #{settings.meli.refresh_token}"
end

get '/login' do
    "<a href='#{settings.meli.auth_url("http://localhost:4567/authorize")}'>Login</a>"
end
