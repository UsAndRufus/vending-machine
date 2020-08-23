require_relative 'coin'
require_relative 'coin_store'
require_relative 'product'
require_relative '../helper/currency_helper'

class VendingMachine
  include CurrencyHelper

  attr_accessor :products
  attr :payment, :bank

  def initialize
    @payment = []
    @payment = CoinStore.new
    @bank = CoinStore.new
    restock
  end

  def insert(coin)
    payment.add coin
  end

  def purchase(product_name)
    product_name = product_name.downcase

    if @products.key? product_name

      product = @products[product_name]

      if payment.sum > product.price
        dispense product_name
        "Enjoy your #{product.name}!"
      else
        "Not enough money - you have entered #{format_currency payment.sum}, but the product costs #{format_currency product.price}"
      end
    else
      "Product '#{product_name}' does not exist"
    end
  end

  def restock
    stock_coins
    stock_products
  end

  protected

  def dispense(product_name)
    products.delete product_name
  end

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
    ].map{|p|[p.name.downcase, p] }.to_h
  end
end