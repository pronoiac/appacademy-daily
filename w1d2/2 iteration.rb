#Finding number divisible 7 after 250
num = 250
until num % 7 == 0
  num += 1
end

puts num

#Factoring numbers
def factors(num)
  1.upto(num) do |divisor|
    puts divisor if num % divisor == 0  
  end
end

def bubble_sort(arr)
  index = 0
  arr.length.times do  
    index = 0
    # make one pass
    while index < arr.length - 1
      if arr[index] > arr[index + 1]
        arr[index + 1], arr[index] = arr[index], arr[index + 1]
        sorted = false
      end
      index += 1    
    end
  end
end

def substrings(str)
  answer = []
  (0...str.length).each do |index|
    (index...str.length).each do |j|
      answer.push str[index..j]
    end
  end
  answer
end

def subwords(str)
  results = []
  
  segments = substrings(str)
  
  File.foreach("dictionary.txt") do |line|
    line.chomp!
    results.push(line) if segments.include?(line)
  end
  
  results
end