# def handle_guess_response
#   return puts "Already guessed!" if @guessed_letters.include?(@guess)
#   if @secret_word.include?(@letter)
#       @matches.each { |i| @current_board[i] = @letter }
#       @guessed_letters << @letter
#   else
#     @guesses_left -= 1
#   end
#
# end
#
# 1 2 3 4 5 6
# Which letters? > "1, 4, 6"
#
# def guess_check
#   gets.chomp.split.to_a
# end
#
# >"Which spaces? Ex: 1,5,6. PLEASE USE COMMAS!!!"
# >1,5,6
# >input.split(',').map(&:to_i)

dic = %w(happy slappy fumble harppy puppy)
board = %w(- a p p y)
temp = board.join.gsub("-", "")
dic = dic.select {|word| word.length == board.length }
p dic.select {|word| word.include?(temp)}