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
        change = dispense_change_for product.price
        dispense_product product_name
        msg = "Enjoy your #{product.name}! "
        if change.count > 0
          msg << "Your change is: #{change.map { |p| format_currency(p.value) }.join(", ")}"
        end
        msg
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

  def dispense_change_for(price)
    paid = @payment.empty
    @bank.stock paid

    @bank.dispense paid.sum - price
  end

  def dispense_product(name)
    products.delete name
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