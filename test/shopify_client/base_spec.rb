describe ShopifyClient::Base do

  before do
    @base = ShopifyClient::Base.new(:id => 1)
  end

  describe "#attributes" do
    it "returns a hash of attributes" do
      @base.attributes.must_equal({:id => 1})
    end
  end
end
