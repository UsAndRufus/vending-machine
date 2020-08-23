require 'securerandom'

class Product
  attr :id, :name, :price

  def initialize(name, price)
    @id = SecureRandom.hex
    @name = name
    @price = price
  end

  def to_s
    "#{name} (#{price})"
  end
end