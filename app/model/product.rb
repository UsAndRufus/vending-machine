require_relative '../helper/currency_helper'

class Product
  include CurrencyHelper

  attr :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{name} (#{format_currency price})"
  end
end