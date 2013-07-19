describe ShopifyClient::CustomCollection do

  before do
    @custom_collection =  ShopifyClient::CustomCollection.new({ :body_html => "<p>The best selling ipod ever</p>",
                                                                :handle => "ipods",
                                                                :id => 841564295,
                                                                :products_count => 1
                                                              })

  end

  describe "#handle" do
    it "returns the collection's handle" do
      @custom_collection.handle.must_equal 'ipods'
    end
  end

end

