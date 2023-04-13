require './spec/spec_helper'

game1 = Game.new

# game1.place_human_submarine
# game1.place_human_cruiser
# game1.display_boards

puts "Time for me to take my shot!"
human_keys = @game1.human_board.cells.keys
target = human_keys.sample(1)
human_keys.delete(target[0])
