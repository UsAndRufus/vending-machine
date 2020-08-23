class CoinStore

  attr_accessor :coins

  def initialize
    @coins = {}
  end


  def add(coin)
    @coins[coin.name] = [] if @coins[coin.name].nil?
    @coins[coin.name] << coin
  end

  def stock(coins)
    coins.each { |coin| add coin}
  end

  def print_contents
    @coins.each { |key, value| puts " - #{key}: #{value.count}" }
  end

  def count
    @coins.values.map(&:count).sum
  end

  def sum
    @coins.values.map(&:sum).sum
  end

end