num_array = []
  
puts "This is an RPN calculator, enter input to calculate."
puts "Enter one operator per line."

def evaluate(operand)
  case operand
  when "+" 
    num_array.push num_array.pop + num_array.pop
  when "-"
    num_array.push num_array.pop - num_array.pop
  when "*"
    num_array.push num_array.pop * num_array.pop  
  when "/"
    num_array.push num_array.pop / num_array.pop
  when "="
    puts num_array.last
  else
    num_array.push input.to_i
  end
end # evaluate 

while true
  input = gets.chomp
  evaluate input #, num_array
end