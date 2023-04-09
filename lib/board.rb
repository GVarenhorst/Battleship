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

  def valid_placement?(ship, coordinates)
    coordinate_letters = coordinates.map { |coord| coord[0] }
    coordinate_numbers = coordinates.map { |coord| coord[1] }

    ord = coordinate_letters.map(&:ord)
    num = coordinate_numbers.map(&:to_i)

    (ship.length == 2 && coordinates.length == 2 ||
    ship.length == 3 && coordinates.length == 3) &&
    (((coordinate_letters.uniq.size == 1 &&
    (num.each_cons(2).all? { |x,y| y == x + 1})) ||
    (num.uniq.size == 1 && ord.each_cons(2).all? { |x,y| y == x + 1}))) &&
    (coordinates.all? {|cell| @cells[cell].empty?})
  end
end