require "debugger"
require "json"
require "yaml"

class Tile
  attr_reader :revealed, :neighboring_bombs, :position
  attr_accessor :bombed, :flagged
  
  def initialize(board, row, col)
    @board = board
    @position = [row, col]
    # @board = Board.new(9) { Tile.new }
    @bombed = false
    @flagged = false
    # debugging! 
    @revealed = false
    @revealed = true
    @neighboring_bombs = nil
  end
  
  def print_tile
    return "F" if @flagged
    return "*" unless @revealed
    if @revealed
      return "B" if @bombed
      return @neighboring_bombs.to_s unless @neighboring_bombs.nil?
      # else, it's clear
      "_" 
    end
  end

  def neighbor_bomb_count
    return @neighboring_bombs unless @neighboring_bombs.nil?
    count = 0
    self.neighbors.each do |tile_object|
      count += 1 if tile_object.bombed
    end
    @neighboring_bombs = count
    p "nbc: #{count}"
    count
  end
  
  def neighbors # (old_x, old_y)
    # lists valid neighboring squares, not going off the board
    possible_steps = [
      [-1, -1], [+0, -1], [+1, -1],
      [-1, +0],           [+1, +0],
      [-1, +1], [+0, +1], [+1, +1]
    ]
    results = []
    old_x, old_y = @position[0], @position[1]
    possible_steps.each do |step_x, step_y|
      new_x = old_x + step_x
      new_y = old_y + step_y
      
      next unless new_x.between?(0, 8)
      next unless new_y.between?(0, 8)
      results << @board[new_x, new_y]
    end
    results
  end
    
  def inspect2
    "pos: #{position}, bomb: #{bombed}, flag: #{flagged}, rev: #{revealed}\n"
  end
end

class Board
  attr_accessor :board
  # has lots of tiles... 9x9. 
  # 2d array, like [2][3] = "x"
  # do that with 9 rows, I think. 
  def initialize()
    # make new 9x9 board. 
    @board = Array.new(9) { |row| Array.new(9) { |col| Tile.new(self, row, col) } }
    # populate board - plant bombs?
    #debugger
    plant_bombs(@board)
    # debugger
    
    # puts "Board, new board: #{@board}"
    puts "within board."
  end
  
  def [](row, col)
    @board[row][col]
  end
  
  def plant_bombs(board) 
    # get random coordinates
    10.times do |plant|
      x, y = rand(0..8), rand(0..8)
      board[x][y].bombed = true
    end
      
    # TODO: already bombed? choose another. 
  end
  
  def plant_flag(position)    
    x, y = position    
    self[x, y].flagged = true
  end
  
  def reveal(position)
    x, y = position
    # is it a bomb? then lose immediately.
    puts "You lose! Um, really. Go home." if self[x, y].bombed
    
    #return :b # not done yet. :)
    
    # any neighboring bombs? say so. 
    # if there are neighboring bombs, say so, and set @neighboring_bombs for printing.
    nbc = self[x, y].neighbor_bomb_count
    puts "bombs: #{nbc}"
    return nbc unless nbc == 0
    
    # self = :r
    
    # has it already been revealed? if so, skip it.
    # if tile is dont know
    #   and doesn't contain a bomb, a flag, or has neighboring bombs
    # reveal it
    #if @tile_status == :d && !:f

    # if it's clear, reveal all the neighbors, too.
    
    self[x, y].neighbors.each.reveal
        
  end
  
  def serialize
    @board.to_yaml
    p @board
  end
end

class Game
  # handle turn taking.
  # options: reveal a space, flag a bomb.
  def initialize()
    # create board
    @board = Board.new
  end
  
  def display_board
    header = "  0 1 2 3 4 5 6 7 8 "
    puts header # header - like 1 2 3 4 5 6 7 8 9
    #   1 2 3 4 5 6 7 8 9 x
    # 1 . . . _ _ _ _ 3 _ 
    # 2 . . . ? ? ? ? ? ? 
    # loop over rows
    (0..8).each do |row|
      print "#{row}"
      # loop over cols
      (0..8).each do |col|
        # get "print_tile" for each tile, and print it. 
        # debugger
        print "|" + @board[row, col].print_tile
      end
      puts "|#{row}"
    end
    puts header
  end
    
  def take_turn
    puts "Take a turn. What action and coordinates?"
    puts "note (x, y) = x is vertical row, y is horizontal column"
    puts "r (coord) - e.g. r 1 3"
    puts "f (coord) - e.g. f 3 1"
    puts "q to quit? might not be implemented."
    print "> "
    input = gets.chomp.split
    x = input[1].to_i
    y = input[2].to_i
    case input[0]
    when "r", "R"
      @board.reveal([x, y])
    when "f", "F"
      @board.plant_flag([x, y])
    when "s", "S"
      @board.serialize
    end
  end
  
  def run
    while true
      display_board
      take_turn
    end
  end
    
  
end

def testing
  # square = Tile.new# (???)
  #
  # puts "neighbors for (2, 3)"
  # p square.neighbors(2, 3)
  #
  # puts "neighbors for (0, 0)"
  # p square.neighbors(0, 0)
  
  game = Game.new
  # game.display_board
  game.run
  
end

def testing_game
  
end

testing
