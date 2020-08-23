require 'securerandom'
require_relative '../helper/currency_helper'

class Product
  include CurrencyHelper

  attr :id, :name, :price

  def initialize(name, price)
    @id = SecureRandom.hex
    @name = name
    @price = price
  end

  def to_s
    "#{name} (#{format_currency price})"
  end
end