class Coin

  attr_accessor :name, :value

  def initialize(name, value)
    @name = name
    @value = value
  end

  def +(obj)
    raise ArgumentError unless obj.is_a? Coin

    value + obj.value
  end
end
