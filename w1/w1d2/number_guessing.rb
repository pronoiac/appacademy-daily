# generate a random number, between 1 and 100. 
secret = rand (101) # 100 is an option

guessed = false
guess_count = 0 

# loop: 
until guessed
  #   prompt the user for a guess
  puts "I'm thinking of a number between 1 and 100."
  puts "Take a guess!"
  
  #   get a number
  guess = gets.chomp.to_i
  
  #   say "too high" or "too low"
  if guess < secret
    puts "Haha nope. Too low!"
  elsif guess > secret
    puts "You are too high."
  else
    puts "Whoa, you guessed it!"
    puts "It only took you #{guess_count} guesses!"
    guessed = true
  end
  
  #   increment guess_count
  guess_count += 1
end