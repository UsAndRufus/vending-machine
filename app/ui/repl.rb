require_relative '../model/vending_machine'
require_relative 'printer'

require 'readline'

class Repl
  attr :vending_machine

  def initialize
    @vending_machine = VendingMachine.new
    @printer = Printer.new
  end

  def run
    puts "Welcome to the vending machine"
    puts "We accept #{Coin::COINS.keys.join(", ")} coins"
    puts "Use Ctrl+D to exit"

    @printer.print_contents @vending_machine

    while input = Readline.readline("> ", true)
      parse input
    end
  end

  protected

  def parse(input)
    command, value = input.split

    case command
    when "bank"
      bank
    when "buy"
      purchase value
    when "contents"
      contents
    when "insert"
      insert value
    when "payment"
      payment
    when "products"
      products
    when "purchase"
      purchase value
    when "restock"
      restock
    else
      unrecognised command
    end
  end

  def bank
    @printer.print_coins @vending_machine
  end

  def contents
    @printer.print_contents @vending_machine
  end

  def insert(value)
    coin = Coin.parse value

    if coin.nil?
      puts "Unrecognised coin '#{value}'"
    else
      @vending_machine.insert coin
      payment
    end
  end

  def payment
    @printer.print_payment @vending_machine
  end

  def products
    @printer.print_products @vending_machine
  end

  def purchase(product)
    puts @vending_machine.purchase product
  end

  def restock
    @vending_machine.restock
    @printer.print_contents @vending_machine
  end

  def unrecognised(command)
    puts "Unrecognised command '#{command}'"
  end
end
