def rps(player_choice)
  
  options = ["rock", "paper", "scissors"]
  
  computer_choice = options.sample.downcase
  player_choice = player_choice.downcase
  return "#{player_choice.capitalize}, draw" if player_choice == computer_choice
  
  player_choice_num = options.index(player_choice)
  computer_choice_num = options.index(computer_choice)
  
  # debugger
  
  puts "computer choice: #{computer_choice}"
  
  diff = (player_choice_num - computer_choice_num) % 3
  if diff == 1
    # player wins
    return "#{player_choice}, Win"
  else
    # player loses
    return "#{player_choice}, Lose"
  end
end

def remix(arr)
  alcohols = []
  mixers = []
  
  arr.each do |booze, mixer|
    alcohols << booze
    mixers << mixer
  end
  alcohols.zip(mixers.shuffle)
  #
  # alcohols.shuffle!
  # mixers.shuffle!
  #
  # results = []
  #
  # alcohols.each_with_index do |alcohol, index|
  #   mixer = mixers[index]
  #   results << [alcohol, mixer]
  # end
  #
  # results
end

