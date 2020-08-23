require_relative '../model/vending_machine'
require "readline"

class Repl

  attr :vending_machine

  def initialize
    @vending_machine = VendingMachine.new
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
    when "contents"
      @vending_machine.print_contents
    else
      puts "Unrecognised command '#{command}'"
    end
  end
end
