require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
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
end