describe ShopifyClient::Shop do

  before do
    @shop =  ShopifyClient::Shop.new({ :id => 1, :name => "Example Shop",
                                       :email => "example@shopify.com" })
  end

  describe "#name" do
    it "returns the shop's name" do
      @shop.name.must_equal "Example Shop"
    end
  end

end
