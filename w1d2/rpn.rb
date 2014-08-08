#!/usr/bin/env ruby

require "debugger"

class MyRPN
  def initialize
    @stack = []
  end
  
  def calc(operand)
    
    case operand
    when "+"
      @stack.push @stack.pop + @stack.pop
    when "-"
      @stack.push @stack.pop - @stack.pop
    when "*"
      @stack.push @stack.pop * @stack.pop  
    when "/"
      @stack.push @stack.pop / @stack.pop
    when "="
      puts @stack.last
    when "q"
      return false
    else
      @stack.push operand.to_i
    end # /case
    debugger
    return @stack.last if @stack.length == 1      
      
    true
  end # calc 
end # /RPN

def interactive
  puts "This is an RPN calculator, enter input to calculate."
  puts "Example: 2 3 + ="
  puts "Enter q to exit."

  rpn = MyRPN.new;
  rolling = true
  while rolling
    input = gets #.chomp
    input.split.each do |item|
      rolling = rpn.calc item 
      #rolling = rpn.process(input)
      p rolling
    end
  end
  
  puts "Exiting!"
end

def from_file(filename)
  # note: non-functional.
  puts "Processing file..."
  File.foreach(filename) do |line|
    # line.chomp!
    line.split.each do |item|
      rolling = rpn.process line
      p rolling
    end
  end
end # /from_file

# main
interactive
# from_file "rpn_test.txt"

