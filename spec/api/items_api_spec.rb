=begin
#MELI Markeplace SDK

#This is a the codebase to generate a SDK for Open Platform Marketplace

The version of the OpenAPI document: 3.0.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'spec_helper'
require 'json'

# Unit tests for Meli::ItemsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ItemsApi' do
  before do
    # run before each test
    @api_instance = Meli::ItemsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ItemsApi' do
    it 'should create an instance of ItemsApi' do
      expect(@api_instance).to be_instance_of(Meli::ItemsApi)
    end
  end

  # unit tests for items_id_get
  # Return a Item.
  # @param id 
  # @param [Hash] opts the optional parameters
  # @return [AnyType]
  describe 'items_id_get test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for items_id_put
  # Update a Item.
  # @param id 
  # @param access_token 
  # @param item 
  # @param [Hash] opts the optional parameters
  # @return [AnyType]
  describe 'items_id_put test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for items_post
  # Create a Item.
  # @param access_token 
  # @param item 
  # @param [Hash] opts the optional parameters
  # @return [AnyType]
  describe 'items_post test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
