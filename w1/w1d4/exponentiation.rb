def exp1(base, power)
  # p "base, power: #{base}, #{power}"
  return 1 if power == 0
  base * exp1(base, power - 1)
end # /exp1

def exp2(base, power)
  return 1 if power == 0
  return base if power == 1
  if power % 2 # even
    return exp2(base, power / 2) * exp2(base, power / 2)
  else # odd
    return base * exp2(base, power / 2) * exp2(base, power / 2)
  end
end # /exp2

def testing
  puts "testing with 2^8..."

  # recursion 1
  puts "\nexp1..."
  p exp1(2, 8) 

  # recursion 2
  puts "\nexp2..."
  p exp2(2, 8)
  
  power = 2560
  puts "\n\ntesting with 2^power..."

  # recursion 1
  # dies around 8100-8192 recursions
  puts "\nexp1..."
  p exp1(2, power) 

  # recursion 2
  # 4.82 sec: 2560000
  # 279.13 sec: 25600000
  puts "\nexp2..."
  p exp2(2, power)

end # /testing

testing
  