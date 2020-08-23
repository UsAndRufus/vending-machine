require_relative '../../app/model/vending_machine'
require "minitest/autorun"

describe VendingMachine do
  describe "When creating a new vending machine" do
    before do
      @vending_machine = VendingMachine.new
    end

    it "initialises it with 100 random coins" do
      assert_equal 100, @vending_machine.coins.count
    end

    it "initialises it with 5 products" do
      assert_equal 5, @vending_machine.products.count
    end
  end

  describe "When calling restock" do
    before do
      @vending_machine = VendingMachine.new

      @vending_machine.coins = []
      @vending_machine.products = @vending_machine.products.first(2)

      @vending_machine.restock
    end

    it "resets coins to 100 random coins" do
      assert_equal 100, @vending_machine.coins.count
    end

    it "resets products to 5 products" do
      assert_equal 5, @vending_machine.products.count
    end
  end
end


