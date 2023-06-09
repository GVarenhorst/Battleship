require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)    
  end

  describe '#initialize' do
    it 'exists' do

      expect(@board).to be_a(Board)
    end
  end

  describe '#board cells' do
    it 'contains hash of cells' do

      expect(@board.cells.count).to eq(16)
      expect(@board.cells).to be_a Hash
      expect(@board.cells["A1"]).to be_a(Cell)
      expect(@board.cells["B1"]).to be_a(Cell)
      expect(@board.cells["D3"]).to be_a(Cell)
    end
  end

  describe '#validates coordinates' do
    it 'is a coordinate on the board' do
      
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe '#validating placements' do
    it 'has ship length and coordinates are the same' do

      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'has to be consecutive coordinates' do
      # require 'pry'; binding.pry
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end

    it 'cannot be diagonal coordinates' do

      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end

    it 'passes placement on the board' do

      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
    end

    it 'can place ships' do
      @board.place(@cruiser, ["A1", "A2", "A3"])

      @cell_1 = @board.cells["A1"]
      @cell_2 = @board.cells["A2"]
      @cell_3 = @board.cells["A3"]
      
      expect(@cell_1.ship).to eq(@cruiser)
      expect(@cell_2.ship).to eq(@cruiser)
      expect(@cell_3.ship).to eq(@cruiser)
      expect(@cell_3.ship).to eq(@cell_2.ship)
    end
    
    it 'does not overlap ships' do
      
      @board.place(@cruiser, ["A1", "A2", "A3"])
      
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end
  end

  describe '#renders board' do
    xit 'renders the board' do

      @board.place(@cruiser, ["A1", "A2", "A3"])
      
      expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end
