def r_fibonacci(count)
  # from CJ's morning lecture!
  return [0] if count == 1
  return [0, 1] if count == 2
  previous = r_fibonacci(count - 1)
  return previous << previous[-2] + previous[-1]
end

def i_fibonacci(count) 
  #caches results
  fib_array = [0, 1]

  (count-2).times do
    fib_array << fib_array[-2] + fib_array[-1]
  end
  fib_array
end

def testing
  puts "Testing recursive fibonacci..."
  puts "First 7:"
  p r_fibonacci(7)
  
  puts "12:"
  p r_fibonacci(12)
  
  puts "\nTesting iterative fibonacci..."
  puts "First 7:" 
  p i_fibonacci(7)
  
  puts "12:"
  p i_fibonacci(12)
  
  puts "First 7:"
  p i_fibonacci(7)
  
  puts "First 100:"
  p i_fibonacci(100)
end

testing