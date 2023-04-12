require 'board'
class Game
  attr_reader :menu
  def initialize
    @comp_submarine = Ship.new("submarine", 2)
    @comp_cruiser = Ship.new("cruiser", 3)
    @human_submarine = Ship.new("submarine", 2)
    @human_cruiser = Ship.new("cruiser", 3)
    @comp_board = Board.new
  end
  

  def menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit"
    p_or_q = gets
    if p_or_q == p
      setup
    else
      exit
    end
  end

  # def setup

  #   SecureRandom.place_ship
  #   if ship.valid_placement? == true
  #     render.ship
  #   end
  # end  

  def place_comp_submarine
    cells_keys = @comp_board.cells.keys.sample(2)
    until @comp_board.place(@comp_submarine, cells_keys) do  
      place_comp_submarine

    end
    # randomly select coordinates from @cells hash and then call comp_submarine.place && comp_cruiser.place method
    

    
  end
end

#Trying to decide if menu interaction belongs
 #in menu def or whether menu should be called 
  #in runner.rb file.

#