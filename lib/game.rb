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
    @comp_sunk_ships = 0
    @human_sunk_ships = 0
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
    place_comp_cruiser
    place_comp_submarine
    place_human_cruiser
    place_human_submarine
  end  

  def place_comp_submarine
    cells_keys = @comp_board.cells.keys.sample(2)
    if @comp_board.valid_placement?(@comp_submarine, cells_keys)
      @comp_board.place(@comp_submarine, cells_keys)
    else
      place_comp_submarine
    end
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
    puts "  1 2 3 4 \n" + "A . . . . \n" + "B . . . . \n" + "C . . . . \n" + "D . . . . \n"
    puts "Choose 2 coordinates for submarine: "
    sub_coords = gets.chomp.upcase.split
    if @human_board.valid_placement?(@human_submarine, sub_coords)
      @human_board.place(@human_submarine, sub_coords)
    else
      invalid_placement_sub
    end
  end
  
  def place_human_cruiser
    puts "Great! Now for your cruiser ship."
    puts @human_board.render(true)
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
  
  def display_boards
    puts "========COMP BOARD========"
    puts @comp_board.render  
    puts "========HUMAN BOARD========"
    puts @human_board.render(true)
  end

  def comp_turn
    puts "Time for me to take my shot!"
    human_keys = @human_board.cells.keys
    target = human_keys.sample(1).join
    until @human_board.cells[target].fired_upon? == false
      target = human_keys.sample(1)
    end
    @human_board.cells[target].fire_upon
    return_shots(target)
  end

  def human_turn
    puts "Now for you to take your best shot!"
    target = gets.chomp.upcase
    until @comp_board.valid_coordinate?(target) && @comp_board.cells[target].fired_upon? == false
      puts "Sorry, that's an invalid coordinate. Please try again: "
      target = gets.chomp.upcase
    end
    @comp_board.cells[target].fire_upon
    return_shots(target)
  end

  def return_shots(last_shot)
    if @human_board.cells[last_shot].render == "X"
      puts "My shot at #{last_shot} sunk your ship! HAHA"
    elsif @comp_board.cells[last_shot].render == "X"
      puts "Your shot at #{last_shot} sunk my ship! ARGH"
    elsif @human_board.cells[last_shot].render == "H"
      puts "My shot at #{last_shot} was a hit! HAHA"
    elsif @comp_board.cells[last_shot].render == "H"
      puts "Your shot at #{last_shot} was a hit! ARGH"
    elsif @human_board.cells[last_shot].render == "M"
      puts "My shot at #{last_shot} was a miss! ARGH"
    else
      puts "Your shot at #{last_shot} was a miss! HAHA"
    end
  end

  def check_for_sunk_ships

  end
end

#Trying to decide if menu interaction belongs
#in menu def or whether menu should be called 
  #in runner.rb file.

#