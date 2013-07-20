module ShopifyClient
  class Error < StandardError

    attr_reader :status

    def initialize(message, status = nil)
      @message = message
      @status = status
      super(message)
    end

  end
end
