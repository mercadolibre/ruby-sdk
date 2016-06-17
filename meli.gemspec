# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'meli'
  spec.version = '1.0.3.3'
  spec.date = '2016-06-17'
  spec.summary = 'meli'
  spec.description = 'Gem for accesing MercadoLibre API'
  spec.authors = ['Alfredo Bejarano']
  spec.email = 'alfredo.corona@mercadolibre.com.mx'
  spec.files = Dir['lib/**/*.rb', 'lib/**/*.yml']
  spec.homepage = 'http://developers.mercadolibre.com/ruby-sdk/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.2'
  spec.summary       = "MercadoLibre's Ruby SDK"
  spec.description   = "Gem for using MercadoLibre's resources in your Ruby app"
  spec.homepage      = 'http://developers.mercadolibre.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
end
