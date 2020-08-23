require_relative '../helper/currency_helper'

class Printer
  include CurrencyHelper

  def initialize(vending_machine)
    @vending_machine = vending_machine
  end

  def welcome
    puts "Welcome to the vending machine!"
    puts "We accept #{Coin::COINS.keys.join(", ")} coins"
    puts "Use Ctrl+D to exit\n\n"

    print_contents
  end

  def print_contents
    print_coins
    puts "\n"
    print_products
  end

  def print_coins
    puts "Coins:"
    puts @vending_machine.bank.contents_string
    puts "Sum: #{format_currency @vending_machine.bank.sum}"
  end

  def print_payment
    puts "Current payment: #{format_currency @vending_machine.payment.sum}"
  end

  def print_products
    puts "Products:"
    @vending_machine.products.values.each { |c| puts " - #{c.to_s}" }
  end
end