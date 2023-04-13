require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end
  
  describe '#initialize' do
    it 'exists' do

      expect(@game).to be_a(Game)
    end
  end

  describe '#start game' do
    xit 'has a start menu' do
      expect(@game.menu).to eq("Welcome to BATTLESHIP Enter p to play. Enter q to quit")
    end
  end
end