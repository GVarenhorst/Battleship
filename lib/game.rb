require './lib/board'
class Game
  attr_reader :menu
  def initialize
    @comp_submarine = Ship.new("submarine", 2)
    @comp_cruiser = Ship.new("cruiser", 3)
    @human_submarine = Ship.new("submarine", 2)
    @human_cruiser = Ship.new("cruiser", 3)
    @comp_board = Board.new
    @human_board = Board.new
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

  # def place_comp_submarine
  #   cells_keys = @comp_board.cells.keys.sample(2)
  #   until @comp_board.place(@comp_submarine, cells_keys) do  
  #     place_comp_submarine
  #   end
  def place_comp_submarine
    cells_keys = @comp_board.cells.keys.sample(2)
    if @comp_board.valid_placement?(@comp_submarine, cells_keys)
      @comp_board.place(@comp_submarine, cells_keys)
    else
      place_comp_submarine
    end
    cells_keys
  end

  def place_comp_cruiser
    cells_keys = @comp_board.cells.keys.sample(3)
    if @comp_board.valid_placement?(@comp_cruiser, cells_keys)
      @comp_board.place(@comp_cruiser, cells_keys)
    else
      place_comp_cruiser
    end
  end

  def place_human_submarine
    puts "I have placed my ships accordingly."
    puts "Time for you to place yours."
    puts "Choose 2 coordinates for submarine: "
    sub_coords = gets.chomp.upcase.split
    if @human_board.valid_placement?(@human_submarine, sub_coords)
      @human_board.place(@human_submarine, sub_coords)
    else
      invalid_placement_sub
    end
  end
  
  def place_human_cruiser
    puts "I have placed my ships accordingly."
    puts "Time for you to place yours."
    puts "Choose 3 coordinates for cruiser: "
    cruiser_coords = gets.chomp.upcase.split()
    if @human_board.valid_placement?(@human_cruiser, cruiser_coords)
      @human_board.place(@human_cruiser, cruiser_coords)
    else
      invalid_placement_cruiser
    end
  end

  def invalid_placement_sub
    puts "Sorry, those are invalid coordinates. Please Try Again: "
    sub_coords = gets.chomp.upcase.split()
    if @human_board.valid_placement?(@human_submarine, sub_coords)
      @human_board.place(@human_submarine, sub_coords)
    else
      invalid_placement_sub
    end
  end

  def invalid_placement_cruiser
    puts "Sorry, those are invalid coordinates. Please Try Again: "
    cruiser_coords = gets.chomp.upcase.split()
    if @human_board.valid_placement?(@human_cruiser, cruiser_coords)
      @human_board.place(@human_cruiser, cruiser_coords)
    else
      invalid_placement_cruiser
    end
  end
  


  #if human coordinates are invalid p "Those coordinates are invalid. Please try again." then loop back to .place_human_cruiser/submarine
end

#Trying to decide if menu interaction belongs
#in menu def or whether menu should be called 
  #in runner.rb file.

#