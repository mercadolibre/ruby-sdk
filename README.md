![No longer maintained](https://img.shields.io/badge/Maintenance-OFF-red.svg)

### [DEPRECATED] This repository is no longer maintained

> From the first week of April 2021 we will stop maintaining our SDKs.
>
> This project is not functional, the dependencies will not be updated to latest ones.
>
> We recommend you read our [documentation](https://developers.mercadolibre.com).

  <a href="https://developers.mercadolibre.com">
    <img src="https://user-images.githubusercontent.com/1153516/73021269-043c2d80-3e06-11ea-8d0e-6e91441c2900.png" alt="Mercado Libre Developers" width="200"></a>
  </a>

---

<br>
<h1 align="center">
  <a href="https://developers.mercadolibre.com">
    <img src="https://user-images.githubusercontent.com/1153516/29861072-689ec57e-8d3e-11e7-8368-dd923543258f.jpg" alt="Mercado Libre Developers" width="230"></a>
  </a>
  <br><br>
  MercadoLibre's Ruby SDK
  <br>
</h1>

<h4 align="center">This is the official Ruby SDK for MercadoLibre's Platform.</h4>

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build meli.gemspec
```

Then either install the gem locally:

```shell
gem install ./meli-3.0.0.gem
```

(for development, run `gem install --dev ./meli-3.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'meli', '~> 3.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: [https://github.com/mercadolibre/ruby-sdk](https://github.com/mercadolibre/ruby-sdk), then add the following in the Gemfile:

    gem 'meli', :git => 'https://github.com/mercadolibre/ruby-sdk.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Usage

```ruby
# Auth URLs Options by country

# 1:  "https://auth.mercadolibre.com.ar"
# 2:  "https://auth.mercadolivre.com.br"
# 3:  "https://auth.mercadolibre.com.co"
# 4:  "https://auth.mercadolibre.com.mx"
# 5:  "https://auth.mercadolibre.com.uy"
# 6:  "https://auth.mercadolibre.cl"
# 7:  "https://auth.mercadolibre.com.cr"
# 8:  "https://auth.mercadolibre.com.ec"
# 9:  "https://auth.mercadolibre.com.ve"
# 10: "https://auth.mercadolibre.com.pa"
# 11: "https://auth.mercadolibre.com.pe"
# 12: "https://auth.mercadolibre.com.do"
# 13: "https://auth.mercadolibre.com.bo"
# 14: "https://auth.mercadolibre.com.py"

# For example in your app
client_id = "Your client_id"
redirect_uri = "Your redirect uri"
puts '<a href= "https://auth.mercadolibre.com.ar/authorization?response_type=code&client_id=' + client_id + '&redirect_uri=' + redirect_uri +'">'+ Authenticate + '</a>'
```

his will give you the url to redirect the user. You need to specify a callback url which will be the one that the user will redirected after a successfull authrization process.

Once the user is redirected to your callback url, you'll receive in the query string, a parameter named code. You'll need this for the second part of the process

## Examples for OAuth - get token

```ruby
# load the gem
require 'Meli'

api_instance = Meli::OAuth20Api.new
opts = {
  grant_type: 'authorization_code', # String |
  client_id: 'client_id_example', # String |
  client_secret: 'client_secret_example', # String |
  redirect_uri: 'redirect_uri_example', # String |
  code: 'code_example', # String |
  refresh_token: 'refresh_token_example' # String |
}

begin
  #Request Access Token
  result = api_instance.get_token(opts)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling OAuth20Api->get_token: #{e}"
end
```

## Example using the RestClient with a POST Item

```ruby
# load the gem
require 'Meli'

api_instance = Meli::RestClientApi.new
resource = 'resource_example' # String |
access_token = 'access_token_example' # String |
body = nil # Object |

begin
  #Resourse path POST
  result = api_instance.resource_post(resource, access_token, body)
  p result
rescue Meli::ApiError => e
  puts "Exception when calling RestClientApi->resource_post: #{e}"
end
```

## Documentation & Important notes

##### The URIs are relative to https://api.mercadolibre.com

##### The Authorization URLs:

###### Remember set your correct country ID

###### https://auth.mercadolibre.{country_domain}

##### All docs for the library are located [here](https://github.com/mercadolibre/ruby-sdk/tree/master/docs)

##### Check out our examples codes in the folder [examples](https://github.com/mercadolibre/ruby-sdk/tree/master/examples)

##### Don’t forget to check out our [developer site](https://developers.mercadolibre.com/)
