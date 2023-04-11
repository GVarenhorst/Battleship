class Game
  attr_reader :menu
  def initialize
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

  def setup

    SecureRandom.place_ship
    if ship.valid_placement? == true
      render.ship
    end
  end  

  def place_comp_ships
    comp_submarine = Ship.new("submarine", 2)
    comp_cruiser = Ship.new("cruiser", 3)
    # randomly select coordinates from @cells hash and then call comp_submarine.place && comp_cruiser.place method
    rand(@cells)

    
  end
end

#Trying to decide if menu interaction belongs
 #in menu def or whether menu should be called 
  #in runner.rb file.

#