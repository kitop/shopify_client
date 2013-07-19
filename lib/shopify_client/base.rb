module ShopifyClient
  class Base

    attr_reader :attributes
    alias to_h attributes
    alias to_hash attributes
    alias to_hsh attributes

    # Define methods that retrieve the value from an initialized instance variable Hash, using the attribute as a key
    def self.hattr_reader(*attrs)
      mod = Module.new do
        attrs.each do |attribute|
          define_method attribute do
            @attributes[attribute.to_sym]
          end
          define_method "#{attribute}?" do
            !!@attributes[attribute.to_sym]
          end
        end
      end
      const_set(:HashAttributes, mod)
      include mod
    end

    def self.from_response(response)
      new parse_single(response[:body])
    end

    def self.array_from_response(response)
      parse_array(response[:body]).map do |attributes|
        new attributes
      end
    end

    def self.parse_single(body)
      if body
        body[single_name]
      else
        {}
      end
    end

    def self.parse_array(body)
      if body
        body[plural_name]
      else
        []
      end
    end

    def initialize(attributes)
      @attributes = attributes
    end


  end
end
