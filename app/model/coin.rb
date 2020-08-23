class Coin

  attr :name, :value

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

  COINS = [ONE_PENCE, TWO_PENCE, FIVE_PENCE, TEN_PENCE, TWENTY_PENCE, FIFTY_PENCE, ONE_POUND, TWO_POUND]
            .map{|coin| [coin.name, coin] }.to_h

  attr_accessor :name, :value

  def self.random
    COINS.values.sample.clone
  end

  def self.parse(value)
    COINS[value].clone
  end

  def +(obj)
    value + obj.to_i
  end

  def coerce(other)
    [ self, other ]
  end

  def to_i
    value
  end

  def to_s
    name
  end

end
