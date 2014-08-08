class Array
  
  def merge_sort
    
    # base case
    return self if self.length <= 1
    
    # run merge_sort on first and second halves of the array. 
    middle_index = self.length / 2
    
    first_half  = self[0..middle_index -1].merge_sort
    second_half = self[middle_index..-1].merge_sort
    merge(first_half, second_half)
  end
  
  def merge(array1, array2)
    result = []

    return array2 if array1.length == 0
    return array1 if array2.length == 0

    if array1.first > array2.first
      [array2.first] + merge(array1, array2[1..-1])
    else
      [array1.first] + merge(array1[1..-1], array2)
    end
  end
  
end

def testing
  test_array = %w(6 5 3 1 8 9 7 2 4)
  puts "Test array: #{test_array}"
  
  p test_array.merge_sort
end

testing