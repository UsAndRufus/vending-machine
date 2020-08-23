module CurrencyHelper
  def format_currency(pence_value)
    if pence_value < 100
      "#{pence_value}p"
    else
      pound_value = (pence_value / 100.0)
      "£#{'%.2f' % pound_value}"
    end

  end
end