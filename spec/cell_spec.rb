require 'spec_helper'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
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
end