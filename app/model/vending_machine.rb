require_relative 'coin'
require_relative 'coin_store'
require_relative 'product'

class VendingMachine
  # do we want to allow these to be accessed?
  attr_accessor :products
  attr :payment, :bank

  def initialize
    @payment = []
    @payment = CoinStore.new
    @bank = CoinStore.new
    restock
  end

  def restock
    stock_coins
    stock_products
  end

  protected

  def stock_coins
    coins = 100.times.map { Coin.random }

    @bank.stock coins
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