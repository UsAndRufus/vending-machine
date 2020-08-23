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

end


