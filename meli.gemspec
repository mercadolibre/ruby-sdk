# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meli/version'

Gem::Specification.new do |spec|
  spec.name = 'meli'
  spec.version = '1.0.3.2'
  spec.date = '2016-04-11'
  spec.summary = 'meli'
  spec.description = 'Gem for accesing MercadoLibre API'
  spec.authors = ['Alfredo Bejarano']
  spec.email = 'alfredo.corona@mercadolibre.com.mx'
  spec.files = Dir['lib/**/*.rb', 'lib/**/*.yml']
  spec.homepage = 'http://developers.mercadolibre.com/ruby-sdk/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.2'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org"
  end

  spec.summary       = "MercadoLibre's Ruby SDK"
  spec.description   = "MercadoLibre's Ruby SDK"
  spec.homepage      = 'http://developers.mercadolibre.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
end
