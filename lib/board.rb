class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => new_cell("A1"),
      "A2" => new_cell("A2"),
      "A3" => new_cell("A3"),
      "A4" => new_cell("A4"),
      "B1" => new_cell("B1"),
      "B2" => new_cell("B2"),
      "B3" => new_cell("B3"),
      "B4" => new_cell("B4"),
      "C1" => new_cell("C1"),
      "C2" => new_cell("C2"),
      "C3" => new_cell("C3"),
      "C4" => new_cell("C4"),
      "D1" => new_cell("D1"),
      "D2" => new_cell("D2"),
      "D3" => new_cell("D3"),
      "D4" => new_cell("D4")
    }
  end

  def new_cell(cell_name)
    Cell.new(cell_name)
  end

  def valid_coordinate?(coordinate)
    if @cells.include?(coordinate)
      true
    else
      false
    end
  end

  # def new_board
  #   @a_board = Hash.new   
  #   ('A'..'D').each do |letter|
  #       (1..4).each do |i|
  #           @a_board["#{letter}#{i}"] = Cell.new("#{letter}#{i}")
  #           # print @board["#{letter}#{i}"]
  #       end
  #   end
  # end
end