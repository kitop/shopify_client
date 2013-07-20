require 'faraday'
require 'multi_json'

module ShopifyClient
  module Response

    class ParseJson < Faraday::Response::Middleware

      def parse(body)
        if body
          MultiJson.load(body, :symbolize_keys => true)
        end
      end

      def on_complete(env)
        env[:body] = parse(env[:body]) unless [204, 301, 302, 304].include?(env[:status])
      end

    end

  end
end
