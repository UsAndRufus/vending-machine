require_relative '../helper/currency_helper'

class Printer
  include CurrencyHelper

  def print_contents(vending_machine)
    print_coins vending_machine
    print_products vending_machine
  end

  def print_coins(vending_machine)
    puts "Coins:"
    vending_machine.bank.print_contents
    puts "Sum: #{format_currency vending_machine.bank.sum}"
  end

  def print_products(vending_machine)
    puts "Products:"
    vending_machine.products.each { |c| puts " - #{c.to_s}" }
  end
end