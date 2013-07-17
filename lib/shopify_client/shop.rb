module ShopifyClient

  class Shop

    def self.from_response(response)
      @attrs = parse_body(response[:body])
    end

    def self.parse_body(body)
      if body
        body[:shop]
      else
        {}
      end
    end

  end

end
