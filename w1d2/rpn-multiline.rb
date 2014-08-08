num_array = []

puts "This is an RPN calculator, enter input to calculate."
puts "Enter one operator per line, or q to exit"

while true
  input = gets.chomp
  case input
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
  when "q"
    break
  else
    num_array.push input.to_i
  end
end