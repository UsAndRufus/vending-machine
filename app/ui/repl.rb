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
    puts "We accept 1p, 2p, 5p, 10p, 20p, 50p, £1, and £2 coins"
    puts "Use Ctrl+D to exit"

    while input = Readline.readline("> ", true)
      parse input
    end
  end

  def parse(input)
    command, value = input.split

    case command
    when "bank"
      bank
    when "contents"
      contents
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

  def unrecognised(command)
    puts "Unrecognised command '#{command}'"
  end
end
