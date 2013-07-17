require 'faraday'
require 'json'

module ShopifyClient
  module Response

    class ParseJson < Faraday::Response::Middleware

      def parse(body)
        JSON.parse(body, :symbolize_names => true)
      end

      def on_complete(env)
        env[:body] = parse(env[:body]) unless [204, 301, 302, 304].include?(env[:status])
      end

    end

  end
end
