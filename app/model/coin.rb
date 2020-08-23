class Coin

  def initialize(name, value)
    @name = name
    @value = value
  end

  ONE_PENCE = Coin.new("1p", 1).freeze
  TWO_PENCE = Coin.new("2p", 2).freeze
  FIVE_PENCE = Coin.new("5p", 5).freeze
  TEN_PENCE = Coin.new("10p", 10).freeze
  TWENTY_PENCE = Coin.new("20p", 20).freeze
  FIFTY_PENCE = Coin.new("50p", 50).freeze
  ONE_POUND = Coin.new("£1", 100).freeze
  TWO_POUND = Coin.new("£2", 200).freeze

  attr_accessor :name, :value

  def self.random
    [ONE_PENCE, TWO_PENCE, FIVE_PENCE, TEN_PENCE, TWENTY_PENCE, FIFTY_PENCE, ONE_POUND, TWO_POUND].sample.clone
  end

  def +(obj)
    raise ArgumentError unless obj.is_a? Coin

    value + obj.value
  end

  def to_s
    name
  end
end
