require_relative '../../app/model/vending_machine'
require "minitest/autorun"

describe VendingMachine do
  describe "When creating a new vending machine" do
    before do
      @vending_machine = VendingMachine.new
    end

    it "initialises it with 100 random coins" do
      assert_equal 100, @vending_machine.bank.count
    end

    it "initialises it with 5 products" do
      assert_equal 5, @vending_machine.products.count
    end
  end

  describe "When purchasing" do
    before do
      @vending_machine = VendingMachine.new
      @vending_machine.products = {"crisps" => Product.new("Crisps", 150) }
      assert_equal 1, @vending_machine.products.count

      @coin = Coin::ONE_POUND.clone
    end

    it "fails if the product doesn't exist" do
      assert_equal  "Product 'fanta' does not exist", @vending_machine.purchase("fanta")

      assert_equal 1, @vending_machine.products.count
    end

    it "fails if not enough payment has been inserted" do
      @vending_machine.insert @coin

      assert_equal "Not enough money - you have entered £1.00, but the product costs £1.50",
                   @vending_machine.purchase("crisps")

      assert_equal 1, @vending_machine.products.count
    end

    it "succeeds if the product exists and enough payment has been inserted" do
      @vending_machine.insert @coin
      @vending_machine.insert @coin

      assert_equal "Enjoy your Crisps! Your change is: 50p", @vending_machine.purchase("crisps")

      assert_equal 0, @vending_machine.products.count
    end
  end

  describe "When calling dispense_change" do
    before do
      @vending_machine = VendingMachine.new
      @vending_machine.bank.empty
      @vending_machine.bank.stock [ Coin::FIVE_PENCE, Coin::FIVE_PENCE, Coin::TWENTY_PENCE, Coin::TWENTY_PENCE ]

      @vending_machine.payment.empty
      @vending_machine.payment.stock [Coin::ONE_PENCE, Coin::ONE_POUND]
    end

    it "should combine the coin stores" do
      @vending_machine.send(:dispense_change_for, 55)
      assert @vending_machine.payment.coins.empty?

      expected = {"£1" => [Coin::ONE_POUND], "5p" => [Coin::FIVE_PENCE]}
      assert_equal expected, @vending_machine.bank.coins
    end

    it "should dispense the change" do
      assert_equal [Coin::TWENTY_PENCE, Coin::TWENTY_PENCE, Coin::FIVE_PENCE, Coin::ONE_PENCE],
                   @vending_machine.send(:dispense_change_for, 55)
    end
  end

  describe "When calling restock" do
    before do
      @vending_machine = VendingMachine.new

      @vending_machine.bank.coins = {}
      @vending_machine.products = @vending_machine.products.first(2)

      @vending_machine.restock
    end

    it "resets coins to 100 random coins" do
      assert_equal 100, @vending_machine.bank.count
    end

    it "resets products to 5 products" do
      assert_equal 5, @vending_machine.products.count
    end
  end
end


