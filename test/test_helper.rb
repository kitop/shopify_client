require 'shopify_client'
require 'minitest'
require 'webmock/minitest'
require 'minitest/autorun'

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

