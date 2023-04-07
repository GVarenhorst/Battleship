require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe '#initialize' do
    it 'exists' do

      expect(@cell_1).to be_a(Cell)
    end

    it 'has a coordinate' do

      expect(@cell_1.coordinate).to eq("B4")
    end

    it 'it can contain a ship' do

      expect(@cell_1.ship).to eq(nil)
    end

    it 'cell is empty' do

      expect(@cell_1.empty?).to eq(true)
    end
  end

  describe '#placing ship' do
    it 'places ship in a cell' do

      @cell_1.place_ship(@cruiser)

      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_1.empty?).to eq(false)
    end
  end

  describe '#fired upon' do
    it 'registers a hit on a ship' do

      @cell_1.place_ship(@cruiser)

      expect(@cell_1.fired_upon?).to eq(false)

      @cell_1.fire_upon

      expect(@cell_1.ship.health).to eq(2)
      expect(@cell_1.fired_upon).to eq(true)
    end
  end

  describe '#render cell' do
    it 'returns a string representation of a cell' do
      
      expect(@cell_1.render).to eq(".")
      
      @cell_1.fire_upon
      
      expect(@cell_1.render).to eq("M")

      @cell_2.place_ship(@cruiser)

      expect(@cell_2.render).to eq(".")
      expect(@cell_2.render(true)).to eq("S")

      @cell_2.fire_upon

      expect(@cell_2.render).to eq("H")
      expect(@cruiser.sunk?).to eq(false)

      @cruiser.hit
      @cruiser.hit

      expect(@cruiser.sunk?).to eq(true)
      expect(@cell_2.render).to eq("X")
    end
  end
end