require './spec_helper'

RSpec.describe Ship do
  
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  describe '#initialize' do 
    it 'can initialize' do

      expect(@cruiser).to be_a(Ship)
    end

    it 'has a name' do

      expect(@cruiser.name).to eq("Cruiser")
    end

    it 'has a length' do
      
      expect(@cruiser.length).to eq(3)
    end
  end

  describe '#health' do
    it 'ship has health' do

      expect(@cruiser.health).to eq(3)
    end

    it 'can lose health and sink' do

      expect(@cruiser.sunk?).to eq(false)

      @cruiser.hit

      expect(@cruiser.health).to eq(2)

      @cruiser.hit

      expect(@cruiser.health).to eq(1)
      expect(@cruiser.sunk?).to eq(false)

      @cruiser.hit
      
      expect(@cruiser.sunk?).to eq(true)
    end
  end
  
end