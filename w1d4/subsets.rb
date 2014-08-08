require 'set'

def subsets(full_set)
  #puts "full set: #{full_set}"
  results = Set.new [full_set]
  results << [] # let's just add the 0-length subset
  # results << [full_set]
  # let's see. how about, we remove one item at a time, 
  # then recurse on that set, combining the results?
  (0...full_set.length).each do |i|
    # puts "removing entry # #{i}"
    truncated = full_set.dup
    truncated.delete_at(i)
    # puts "truncated: #{truncated}"
    results = results + subsets(truncated)
  end 
  results.to_a
end # /subsets

def testing
  test_array = [1, 2, 3]
  puts "test array: #{test_array}"
  puts "subsets:"
  p subsets(test_array).sort
end

testing
