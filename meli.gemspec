# -*- encoding: utf-8 -*-

=begin
#MELI Markeplace SDK

#This is the official Ruby SDK for the MercadoLibre Marketplace platform.
=end

$:.push File.expand_path("../lib", __FILE__)
require "Meli/version"

Gem::Specification.new do |s|
  s.name        = "Meli"
  s.version     = Meli::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["MELI"]
  s.email       = [""]
  s.homepage    = "https://github.com/mercadolibre/ruby-sdk"
  s.summary     = "MELI Markeplace SDK Ruby Gem"
  s.description = "This is the official Ruby SDK for the MercadoLibre Marketplace platform."
  s.license     = "Unlicense"
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 2.3', '>= 2.3.0'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
