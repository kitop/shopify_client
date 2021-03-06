require 'faraday'
require 'json'

module ShopifyClient
  module Request

    class ContentType < Faraday::Middleware

      def call(env)
        if env[:body] and env[:body].is_a? Hash
          env[:body] = JSON.dump(env[:body])
          env[:request_headers]["Content-Type"] ||= "application/json"
        end
        @app.call env
      end

    end

  end
end
