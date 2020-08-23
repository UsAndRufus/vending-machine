require_relative 'coin'
require_relative 'product'

class VendingMachine
  # do we want to allow these to be accessed?
  attr_accessor :amount, :coins, :products

  def initialize
    restock
  end

  def restock
    stock_coins
    stock_products
  end

  def print_contents
    puts "Coins:"
    @coins.each { |c| puts c.to_s }
    puts "Products:"
    @products.each { |c| puts c.to_s }
  end

  protected

  def stock_coins
    @coins = 100.times.map { Coin.random }
  end

  def stock_products
    @products = [
        Product.new("Crisps", 150),
        Product.new("KitKat", 100),
        Product.new("Lucozade", 275),
        Product.new("Chocolate", 99),
        Product.new("Freddo", 527)
    ]
  end
end