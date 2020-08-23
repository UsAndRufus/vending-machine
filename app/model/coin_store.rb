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

  def contents_string
    @coins.map { |key, value| " - #{key}: #{value.count}" }.join("\n")
  end

  def dispense(value)
    sorted = @coins.values.flatten.sort_by(&:value)

    dispensed = []

    while value > 0 && !sorted.empty?
      coin = sorted.pop
      if value - coin.value >= 0
        value = value - coin.value
        dispensed << coin
        remove(coin)
      end
    end

    if value != 0
      nil
    else
      dispensed
    end
  end

  def remove(coin)
    @coins[coin.name].pop
    @coins.delete(coin.name) if @coins[coin.name].empty?
  end

  def empty
    coins = @coins.values.flatten
    @coins = {}
    coins
  end

  def count
    @coins.values.map(&:count).sum
  end

  def sum
    @coins.values.map(&:sum).sum
  end

end