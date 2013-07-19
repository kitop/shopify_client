module ShopifyClient

  class CustomCollection

    def self.from_response(response)
      @attrs = parse_body(response[:body])
    end

    def self.parse_body(body)
      if body
        body[:custom_collection]
      else
        {}
      end
    end

  end

end

