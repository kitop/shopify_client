module ShopifyClient

  class CustomCollection

    def self.from_response(response)
      new parse_single(response[:body])
    end

    def self.array_from_response(response)
      parse_array(response[:body]).map do |attrs|
        new attrs
      end
    end

    def self.parse_single(body)
      if body
        body[:custom_collection]
      else
        {}
      end
    end

    def self.parse_array(body)
      if body
        body[:custom_collections]
      else
        []
      end
    end

    def initialize(attrs)
      @attrs = attrs
    end

  end

end

