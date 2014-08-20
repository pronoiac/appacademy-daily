class Hanoi
  
  def initialize
    @towers = [
      [3, 2, 1],
      [],
      []
    ]
    @max_height = @towers[0].length
  end # initialize
            
  def display
    # p @towers
    puts "Towers: "
    @towers.each { |tower| p tower }
  end # of display
  
  def switch(source, destination)
    if @towers[source].empty? 
      puts "Invalid move!"
      return
    end
    
    if @towers[destination].empty? || 
      @towers[source].last < @towers[destination].last 
        @towers[destination].push @towers[source].pop
    else
      puts "Invalid move!"
    end
  end # of switch
  
  def check_for_win
    @towers[2].length == @max_height
    #   return true
    # else
    #   return false
    # end
  end # of check_for_win
  
  def ask_for_input
    puts "Move from which peg?"
    source = gets.to_i
    puts "Move to which peg?"
    destination = gets.to_i
    [source, destination]
  end
  
  def game_loop
    until check_for_win
      display
      source, destination = ask_for_input
      switch(source, destination)
    end
    
    puts "Yay! A winner is you!"
  end
  
end # of Hanoi

#main
game = Hanoi.new
game.game_loop

#test
def test
  game = Hanoi.new
  game.display

  game.switch 0, 1
  game.display

  game.switch 2, 1
  game.display
end