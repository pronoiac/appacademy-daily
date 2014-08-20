def range(start, finish)
  return [start] if start == finish
  [start] + range(start + 1, finish)
end

def r_sum(array)
  return array[0] if array.count == 1
  array[0] + r_sum(array[1..-1])
end

def i_sum(array)
  sum = 0
  array.each { |item| sum += item }
  sum
end


def testing
  puts "testing range, 5 - 10..."
  p range(5, 10)
  
  puts "\ntesting sum recursively"
  p r_sum(range(5,10))

  puts "\ntesting sum iteratively"
  p i_sum(range(5,10))
end

testing