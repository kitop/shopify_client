describe ShopifyClient::CustomCollection do

  before do
    @custom_collection =  ShopifyClient::CustomCollection.new({ :body_html => "<p>The best selling ipod ever</p>",
                                                                :handle => "ipods",
                                                                :id => 841564295,
                                                                :products_count => 1,
                                                                :image => {
                                                                  :created_at => "2013-07-18T13:55:42-04:00",
                                                                  :src => "http://cdn.shopify.com/s/files/1/0006/9093/3842/collections/ipod_nano_8gb.jpg"
                                                                }
                                                              })

  end

  describe "#handle" do
    it "returns the collection's handle" do
      @custom_collection.handle.must_equal 'ipods'
    end
  end

  describe "#image" do
    it "returns a ShopifyClient::Image" do
      @custom_collection.image.must_be_instance_of ShopifyClient::Image
    end
    describe "when image attribute is nil" do
      before do
        @custom_collection =  ShopifyClient::CustomCollection.new({ :body_html => "<p>The best selling ipod ever</p>",
                                                                    :handle => "ipods",
                                                                    :id => 841564295,
                                                                    :products_count => 1
                                                                  })
      end

      it "returns nil" do
        @custom_collection.image.must_be_nil
      end
    end
  end

end
