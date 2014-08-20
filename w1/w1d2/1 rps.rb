require 'debugger'

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

# main

# prompt
puts "We're playing Rock, Paper, Scissors.\nWhat's your choice?"

# loop until they enter a matching option: 
#until options.include?(player_choice.downcase)
  # get input
  player_choice = gets.chomp
  #end
  
# call rps to see if they won
puts rps (player_choice)

# exit
