def subsets(full_set)
  results = []
  results << [] # let's just add the 0-length subset
  # outer loop: 1st item of subset.
  (0...full_set.length).each do |i|
    puts "start with # #{i}"
    # inner loop: length of set, 1 to remaining length of array
    # let's see. say array of 3, starting with 1, should be (1..2)
    # or, do absolute positions
    # (1...full_set.length - i).each do |slice_length|
    (i+1..full_set.length).each do |j|
      # get slice
      slice = full_set[i..j]
      # seen this slice already? 
      results.push slice unless results.include? slice
    end # inner loop      
  end # outer loop
  results 
end # /subsets

def testing
  test_array = [1, 2, 3]
  puts "test array: #{test_array}"
  puts "subsets:"
  p subsets(test_array)
end

testing
