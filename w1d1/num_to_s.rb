def num_to_s(num, base)
  digits = "0123456789ABCDEF"
  result = ""
  while num > 0
    result = digits[num % base] + result
    num = num / base
  end
  result
end

#test
p num_to_s(5, 10) #=> "5"
p num_to_s(5, 2)  #=> "101"
p num_to_s(5, 16) #=> "5"

p num_to_s(234, 10) #=> "234"
p num_to_s(234, 2)  #=> "11101010"
p num_to_s(234, 16) #=> "EA"

p num_to_s(234, 5)
p num_to_s(234, 7)