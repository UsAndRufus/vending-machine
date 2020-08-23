require_relative '../../app/model/coin_store'
require "minitest/autorun"

describe CoinStore do
  describe "When creating a new CoinStore" do
    it "sets up the coins to be an empty hash" do
      @coin_store = CoinStore.new
      expected = {}
      assert_equal expected, @coin_store.coins
    end
  end

  describe "When calling add" do
    before do
      @coin_store = CoinStore.new
      @coin = Coin::ONE_PENCE
    end

    it "adds the coin to the CoinStore" do
      @coin_store.add @coin
      expected = { "1p" => [@coin] }
      assert_equal expected, @coin_store.coins
    end
  end

  describe "When calling stock" do
    before do
      @coin_store = CoinStore.new
      @coins = [ Coin::ONE_PENCE, Coin::TWO_POUND ]
    end

    it "adds all coins to the CoinStore" do
      @coin_store.stock @coins

      expected = { "1p" => [Coin::ONE_PENCE], "£2" => [Coin::TWO_POUND] }
      assert_equal expected, @coin_store.coins
    end
  end

  describe "When calling count" do
    before do
      @coin_store = CoinStore.new
      @coins = [ Coin::ONE_PENCE, Coin::TWO_POUND, Coin::TWO_POUND ]
    end

    it "should be zero when there are no coins in the store" do
      assert_equal 0, @coin_store.count
    end

    it "should be equal to the count of all coins when coins are in the store" do
      @coin_store.stock @coins

      assert_equal 3, @coin_store.count

      @coin_store.add Coin::FIFTY_PENCE

      assert_equal 4, @coin_store.count
    end
  end

  describe "When calling dispense_change_for" do
    before do
      @coin_store = CoinStore.new
      @coin_store.stock [ Coin::ONE_PENCE, Coin::FIVE_PENCE, Coin::FIVE_PENCE, Coin::TEN_PENCE,
                          Coin::FIFTY_PENCE, Coin::FIFTY_PENCE, Coin::TWO_POUND ]
    end

    it "should return nil if it can't dispense the coins because it doesn't have enough value" do
      assert_nil @coin_store.dispense(450)
    end

    it "should return nil if it can't dispense the coins because it doesn't have the right coins" do
      assert_nil @coin_store.dispense(17)
    end

    it "should return the coins and delete the coins from its store if the correct amount can be dispense" do
      coins = @coin_store.dispense(311)

      assert_equal [Coin::TWO_POUND, Coin::FIFTY_PENCE, Coin::FIFTY_PENCE, Coin::TEN_PENCE, Coin::ONE_PENCE], coins

      expected = { "5p" => [ Coin::FIVE_PENCE, Coin::FIVE_PENCE ] }
      assert_equal expected, @coin_store.coins
    end

    it "should return the coins and not give an off by one error" do
      @coin_store = CoinStore.new
      @coin_store.stock [ Coin::ONE_POUND, Coin::FIVE_PENCE, Coin::ONE_PENCE]

      assert_equal [Coin::FIVE_PENCE, Coin::ONE_PENCE], @coin_store.dispense(6)

    end
  end

  describe "When calling sum" do
    before do
      @coin_store = CoinStore.new
      @coins = [ Coin::ONE_PENCE, Coin::ONE_PENCE, Coin::FIVE_PENCE, Coin::TWO_POUND, Coin::TWO_POUND ]
    end

    it "should be zero when there are no coins in the store" do
      assert_equal 0, @coin_store.sum
    end

    it "should be equal to the sum of all coins when coins are in the store" do
      @coin_store.stock @coins

      assert_equal 407, @coin_store.sum

      @coin_store.add Coin::FIFTY_PENCE

      assert_equal 457, @coin_store.sum
    end
  end

  describe "When calling empty" do
    before do
      @coin_store = CoinStore.new
      @coins = [ Coin::ONE_PENCE, Coin::ONE_PENCE, Coin::FIVE_PENCE, Coin::TWO_POUND, Coin::TWO_POUND ]
      @coin_store.stock @coins
    end

    it "should return the coins in the bank" do
      assert_equal @coins, @coin_store.empty
    end
    it "reset the hash" do
      assert @coin_store.empty
    end
  end

end


