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

    it "raises ArgumentError if other object is not a Coin" do
      assert_raises ArgumentError do
        @coin + 23
      end
    end
  end
end


