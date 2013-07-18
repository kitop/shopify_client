describe ShopifyClient do

  describe ".new" do
    it "returns a ShopifyClient::Client instance" do
      client = ShopifyClient.new("http://example.myshopify.com", "abc")
      client.must_be_instance_of ShopifyClient::Client
    end
  end

end
