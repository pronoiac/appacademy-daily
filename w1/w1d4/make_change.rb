def make_change(amount, coins)
  puts "make change: #{amount} #{coins} "

  # max change
  if coins.length == 1
    # worst case.
    # presuming coin of 1.
    result = []
    amount.times do |i| 
      result[i] = coins[0]
    end
    return result
  end
  
  current_best_count = amount 
  
  # biggest first  
  current_best = biggest_first(amount, coins)
  puts "current best: #{current_best}"
  current_best_count = current_best.count
  
  # take off the largest coin, and compare. 
  possible_best = make_change(amount, coins[1..-1])
  if possible_best.count < current_best_count
    puts "new best found!"
    p possible_best
    current_best_count = possible_best.count
    current_best = possible_best
  end
  
  return current_best
end

def biggest_first(amount, coins)
  solution = []
  coin_count = 0
  puts "amount, coins: #{amount}, #{coins}"
  
  coins.each do |coin|
    while amount >= coin
      coin_count += 1
      solution << coin
      amount -= coin
    end
  end
  solution
end


def testing
  puts "make_change for 14, [10, 7, 1]"
  p make_change(14, [10, 7, 1])
  
end

testing