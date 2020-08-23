require_relative '../../app/model/product'
require "minitest/autorun"

describe Product do
  describe "When creating a new product" do
    before do
      @name = "Salt & Vinegar Crisps"
      @price = 150
      @product = Product.new @name, @price
    end

    it "assigns the passed in name and price" do
      assert_equal @name, @product.name
      assert_equal @price, @product.price
    end

    it "generates an ID for the item" do
      assert !@product.id.nil?
    end
  end
end


