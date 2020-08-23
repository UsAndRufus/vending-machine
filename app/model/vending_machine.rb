class VendingMachine
  attr :amount, :coins

  def initialize
    @coins = 100.times.map { Coin.random }
  end

  def print_contents
    puts "Coins:"
    @coins.each { |c| puts c.to_s }
  end
end