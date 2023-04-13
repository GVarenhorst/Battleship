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
    @cells.include?(coordinate)
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

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(view_ships = false)
    puts "  1 2 3 4 \n" + "A #{@cells["A1"].render(view_ships)} #{@cells["A2"].render(view_ships)} #{@cells["A3"].render(view_ships)} #{@cells["A4"].render(view_ships)} \n" + "B #{@cells["B1"].render(view_ships)} #{@cells["B2"].render(view_ships)} #{@cells["B3"].render(view_ships)} #{@cells["B4"].render(view_ships)} \n" + "C #{@cells["C1"].render(view_ships)} #{@cells["C2"].render(view_ships)} #{@cells["C3"].render(view_ships)} #{@cells["C4"].render(view_ships)} \n" + "D #{@cells["D1"].render(view_ships)} #{@cells["D2"].render(view_ships)} #{@cells["D3"].render(view_ships)} #{@cells["D4"].render(view_ships)} \n"
  end
end