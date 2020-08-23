require_relative '../../app/model/coin'
require "minitest/autorun"

describe Coin do
  before do
    @coin = Coin.new "£2", 200
  end

  describe "When adding" do
    it "returns the integer sum of two coins" do
      coin2 = Coin.new "1p", 1
      assert_equal 201, @coin + coin2
    end

    it "returns the integer sum of an integer and a coin" do
      assert_equal 201, 1 + @coin

      assert_equal 201, @coin + 1
    end
  end
end


