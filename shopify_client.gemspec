# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shopify_client/version'

Gem::Specification.new do |spec|
  spec.name          = "shopify_client"
  spec.version       = ShopifyClient::VERSION
  spec.authors       = ["Esteban Pastorino"]
  spec.email         = ["ejpastorino@gmail.com"]
  spec.summary       = %q{Shopify API client.}
  spec.description   = %q{Intented to be a thread-safe replacement of shopify_api.}
  spec.homepage      = "https://github.com/kitop/shopify_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.8"
  spec.add_dependency "multi_json", "~> 1.5"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0.6"
  spec.add_development_dependency "webmock", "~> 1.13.0"
end
