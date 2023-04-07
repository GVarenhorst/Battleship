require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe '#initialize' do
    it 'exists' do

      expect(@cell).to be_a(Cell)
    end

    it 'has a coordinate' do

      expect(@cell.coordinate).to eq("B4")
    end

    it 'it can contain a ship' do

      expect(@cell.ship).to eq(nil)
    end

    it 'cell is empty' do

      expect(@cell.empty?).to eq(true)
    end
  end

  describe '#placing ship' do
    it 'places ship in a cell' do

      @cell.place_ship(@cruiser)

      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to eq(false)
    end
  end

  describe 'fired upon' do
    it 'registers a hit on a ship' do

      @cell.place_ship(@cruiser)

      expect(@cell.fired_upon?).to eq(false)

      @cell.fire_upon

      expect(@cell.ship.health).to eq(2)
      expect(@cell.fired_upon).to eq(true)
    end
  end
end