# You need use this code in to the main folder
# Load the gem
require 'Meli'

api_instance = Meli::OAuth20Api.new
opts = {
  grant_type: 'authorization_code', # Or 'refresh_token' if you need get one new token
  client_id: 'client_id_example', # Your client_id
  client_secret: 'client_secret_example', # Your client_secret
  redirect_uri: 'redirect_uri_example', # Your redirect_uri
  code: 'code_example', # The parameter CODE who was received in the query.
  refresh_token: 'refresh_token_example' # Your refresh_token
}

begin
  #Request Access Token
  result = api_instance.get_token(opts)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling OAuth20Api->get_token: #{e}"
end