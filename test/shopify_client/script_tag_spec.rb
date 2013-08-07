describe ShopifyClient::ScriptTag do

  before do
    @script_tag =  ShopifyClient::ScriptTag.new({ created_at: "2013-08-01T11:13:08-04:00",
                                                  event: "onload",
                                                  id: 596726825,
                                                  src: "http://js-aplenty.com/foo.js",
                                                  updated_at: "2013-08-01T11:13:08-04:00"
                                                 })

  end

  describe "#src" do
    it "returns the script_tag's src" do
      @script_tag.src.must_equal 'http://js-aplenty.com/foo.js'
    end
  end

end



