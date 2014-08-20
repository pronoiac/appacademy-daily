require 'debugger'

def prime?(num)
  # debugger

  (2...num).each do |i|
    if (num % i) == 0
      return false
    end
  end
  true
end

def primes(num_primes)
  ps = []
  num = 1
  while ps.count < num_primes
    primes << num if prime?(num)
  end
end
