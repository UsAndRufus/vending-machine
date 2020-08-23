require_relative '../../app/model/vending_machine'
require "minitest/autorun"

describe VendingMachine do
  describe "When creating a new vending machine" do
    it "initialises it with 100 random coins" do
      vending_machine = VendingMachine.new

      assert_equal 100, vending_machine.coins.count
    end
  end
end


