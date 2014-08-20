#!/usr/bin/env ruby

def median(array)
  sorted = array.sort
  if array.empty?
    return nil
  end
  
  if array.length % 2 == 1
    return sorted[array.length / 2]
  else
    average = (sorted[array.length / 2] + sorted[array.length / 2 -1 ]) / 2
  end
  average
  
end

#test

puts median [3, 3, 5, 9, 11] # 5
puts median [ 3, 5, 7, 9]    # 6
puts median []
    