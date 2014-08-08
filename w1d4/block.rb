class Array  
  def my_each(&proc)
    self.count.times do |i| 
      proc.call(self[i])
    end
    self
  end
  
  def my_map(&proc)
    results = []
    self.my_each do |item|
      result_of_proc = proc.call(item)
      results << result_of_proc
    end
    results
  end
  
  def my_select(&proc)
    results = []
    
    self.my_each do |item|
      results << item if proc.call(item)
    end
    results
  end
  
  def my_inject(&proc)
    memo = nil
    self.my_each do |item|
      if memo.nil? # or is it .empty? 
        memo = item
      else
        memo = proc.call(memo, item)
      end
    end
    memo
  end
  
  def my_sort!(&compare)
    #bubble sort
    sorted = false
    until sorted
      sorted = true
      index = 0
      while index < self.length - 1
        if proc.call(self[index], self[index + 1]) == 1 # <=>
          # swap
          self[index], self[index + 1] = 
            self[index + 1], self[index]
          sorted = false
        end
        index += 1 
      end # counting over indexes
    end # loop until sorted
    self
  end
  
  def my_sort(&compare)
    self.dup.my_sort!(&compare)
  end
end


def testing
  test_arr = [2, 3, 4]
  test_str = %w{cat hat bat}
  mixed_arr1 = [2,6,1,10,15,2,4,11,4]
  mixed_arr2 = [2,6,1,10,15,2,4,11,4]
  puts "Test array: #{test_arr}"
  
  # testing my_each
  puts "Testing my_each with 'puts num + 5'..."
  return_value = test_arr.my_each do |num|
    puts num + 5
  end
  puts "arr value: "
  p return_value # => [1, 2, 3]
  
  # testing my_map
  puts "\ntesting my_map num * 2..."
  return_value = test_arr.my_map do |num|
    num * 2
  end
  puts "final result of my_map: #{return_value}"

  # testing my_select
  puts "\ntesting my_select for even numbers"
  return_value = test_arr.my_select do |num|
    num % 2 == 0
  end
  puts "final result of my_select: #{return_value}"
  
  puts "\nTesting my_inject with + ..."
  return_value = test_arr.my_inject { |sum, num| sum + num}
  puts "return: #{return_value}"
  
  puts "\nTesting my_inject with + on strings..."
  return_value = test_str.my_inject { |sum, num| sum + num}
  puts "return: #{return_value}"
  
  puts "\nTesting my_sort ascending"
  return_value = mixed_arr1.my_sort { |num1, num2| num1 <=> num2 }
  puts "return: #{return_value}"
  puts "what was passed in: #{mixed_arr1}"
  
  puts "\nTesting my_sort descending"
  return_value = mixed_arr2.my_sort { |num1, num2| num2 <=> num1 }
  puts "return: #{return_value}"
  puts "what was passed in: #{mixed_arr2}"
  
  puts "\nTesting my_sort! ascending"
  return_value = mixed_arr1.my_sort! { |num1, num2| num1 <=> num2 }
  puts "return: #{return_value}" 
  
  puts "\nTesting my_sort! descending"
  return_value = mixed_arr2.my_sort! { |num1, num2| num2 <=> num1 }
  puts "return: #{return_value}" 
  
end

testing
