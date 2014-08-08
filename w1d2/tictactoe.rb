class TicTacToe 
  # board:
  # 1|2|3
  # -+-+-
  # 4|5|6
  # -+-+-
  # 7|8|9
  
  def initialize
    @board = "          "
    # 10, as I don't feel like dealing with board[0]
  end
  
  lines = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]
  
  def won?
    lines.each do |line|
      a, b, c = line
      a = @board[a]
      b = @board[b]
      c = @board[c]
      if a != " " && a == b && b == c && a == c
        puts "winner: #{a}" 
        return true
      end
      false
    end
  end # /won? 
  
  def testing
    @board = " xxx      "
    p @board.won?
  end
end # /TicTacToe

board = TicTacToe.new
board.testing
          