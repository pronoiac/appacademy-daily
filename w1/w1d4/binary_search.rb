def bsearch(array, target)
  # p "array: #{array}"

  # base case.
  if array.count == 1
    # match?
    if array[0] == target
      return 0
    else
      # puts "Can't find"
      return nil
    end
  end # /base case.
  
  # look at the middle of array, compare to target. 
  middle_index = array.length / 2
  middle_entry = array[middle_index]
  
  # p "middle_entry is #{middle_entry}"
  
  case target <=> middle_entry
  when 0
    # does it match the target?
    return middle_index
  when 1
    # is target higher? 
    temp = bsearch(array[middle_index + 1..-1], target)
    # p temp
    return nil if temp.nil?
    return middle_index + temp + 1
  when -1  
    # is target lower? look at the lower half.
    temp = bsearch(array[0..middle_index - 1], target)
    # puts "bsearch: #{temp}"
    return temp 
    
    
  end
  
  
end

def testing
  test_array = [1, 5, 10, 15, 20, 25, 30, 40, 50]
  puts "test_array: #{test_array}"
  
  puts "search for 10 (should be 2): "
  puts "Found at index: #{bsearch(test_array, 10)}"
  
  puts "search for 12 (should be nil): "
  puts "Found at index: "
  p bsearch(test_array, 12)
  
  puts "search for 30: "
  puts "Found at index: #{bsearch(test_array, 30)}"
  
  
end

testing