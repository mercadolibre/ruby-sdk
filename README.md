
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
# load the gem
require 'Meli'

api_instance = Meli::OAuth20Api.new
opts = {
  grant_type: 'grant_type_example', # String | 
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

## Documentation & Important notes

##### The URIs are relative to https://api.mercadolibre.com

##### The Authorization URLs:
###### Remember set your correct country ID
###### https://auth.mercadolibre.{country_domain}

#####  All docs for the library are located [here](https://github.com/mercadolibre/ruby-sdk/tree/master/docs)

#####  Check out our examples codes in the folder [examples](https://github.com/mercadolibre/ruby-sdk/tree/master/examples)

##### Don’t forget to check out our [developer site](https://developers.mercadolibre.com/)
