def factors(num)
  1.upto(num) do |divisor|
    puts divisor if num % divisor == 0  
  end
end

factors(100)