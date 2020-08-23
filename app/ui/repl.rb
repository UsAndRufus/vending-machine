require_relative '../model/vending_machine'
require_relative 'printer'

require 'readline'

class Repl
  attr :vending_machine

  def initialize
    @vending_machine = VendingMachine.new
    @printer = Printer.new @vending_machine
  end

  def run
    @printer.welcome

    while input = Readline.readline("> ", true)
      parse input
    end
  end

  protected

  def parse(input)
    command, value = input.split

    case command.downcase
    when "bank"
      bank
    when "buy"
      purchase value
    when "contents"
      contents
    when "help"
      help
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
    @printer.print_coins
  end

  def contents
    @printer.print_contents
  end

  def help
    puts "The available commands are: buy {product}, contents, help, insert {coin}, payment, purchase {product}, restock"
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
    @printer.print_payment
  end

  def products
    @printer.print_products
  end

  def purchase(product)
    puts @vending_machine.purchase product
  end

  def restock
    @vending_machine.restock
    @printer.print_contents
  end

  def unrecognised(command)
    puts "Unrecognised command '#{command}'"
  end
end
