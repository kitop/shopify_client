describe ShopifyClient::SmartCollection do

  before do
    @smart_collection =  ShopifyClient::SmartCollection.new({ :body_html => "<p>The best selling ipod ever</p>",
                                                              :handle => "smart-ipods",
                                                              :id => 482865238,
                                                              :products_count => 0
                                                            })

  end

  describe "#handle" do
    it "returns the collection's handle" do
      @smart_collection.handle.must_equal 'smart-ipods'
    end
  end

end
