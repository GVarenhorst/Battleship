class Cell
  attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if @fired_upon == true
      true
    else 
      false
    end
  end

  def fire_upon
    if @ship != nil
      @ship.hit 
      @fired_upon = true
    else
      @fired_upon = true
    end
  end
end