# -*- encoding: utf-8 -*-

=begin
#MELI Markeplace SDK

#This is a the codebase to generate a SDK for Open Platform Marketplace

The version of the OpenAPI document: 3.0.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

$:.push File.expand_path("../lib", __FILE__)
require "Meli/version"

Gem::Specification.new do |s|
  s.name        = "Meli"
  s.version     = Meli::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["OpenAPI-Generator"]
  s.email       = [""]
  s.homepage    = "https://github.com/mercadolibre/ruby-sdk"
  s.summary     = "MELI Markeplace SDK Ruby Gem"
  s.description = "This is a the codebase to generate a SDK for Open Platform Marketplace"
  s.license     = "Unlicense"
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 2.1', '>= 2.1.0'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
