describe ShopifyClient::SmartCollection do

  before do
    @smart_collection =  ShopifyClient::SmartCollection.new({ :body_html => "<p>The best selling ipod ever</p>",
                                                              :handle => "smart-ipods",
                                                              :id => 482865238,
                                                              :products_count => 0,
                                                              :image => {
                                                                :created_at => "2013-07-18T13:55:42-04:00",
                                                                :src => "http://cdn.shopify.com/s/files/1/0006/9093/3842/collections/ipod_nano_8gb.jpg"
                                                              }
                                                            })

  end

  describe "#handle" do
    it "returns the collection's handle" do
      @smart_collection.handle.must_equal 'smart-ipods'
    end
  end

  describe "#image" do
    it "returns a ShopifyClient::Image" do
      @smart_collection.image.must_be_instance_of ShopifyClient::Image
    end
    describe "when image attribute is nil" do
      before do
        @smart_collection =  ShopifyClient::SmartCollection.new({ :body_html => "<p>The best selling ipod ever</p>",
                                                                  :handle => "ipods",
                                                                  :id => 841564295,
                                                                  :products_count => 1
                                                                })
      end

      it "returns nil" do
        @smart_collection.image.must_be_nil
      end
    end
  end

end
