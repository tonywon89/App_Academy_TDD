require 'rspec'
require 'towers'

describe "Towers" do
  subject(:game) { Towers.new }

  describe "#initialize" do
    it "creates towers" do
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#won?" do
    it "returns false if all pieces on 1st tower" do
      expect(game.won?).to be false
    end

    it "returns true if all pieces on 2nd tower" do
      game.towers = [[], [3,2,1], []]
      expect(game.won?).to be true
    end

    it "returns true if all pieces on 3rd tower" do
      game.towers = [[], [], [3,2,1]]
      expect(game.won?).to be true
    end

    it "returns false if not all pieces on same tower" do
      game.towers = [[2,1],[3],[]]
      expect(game.won?).to be false
    end
  end

  describe "#move" do
    let(:tower_0) { game.towers[0] }
    let(:tower_1) { game.towers[1] }
    let(:tower_2) { game.towers[2] }

    it "moves a disc from one tower to another tower" do
      game.move(tower_0, tower_2)
      expect(game.towers).to eq([[3,2],[],[1]])
    end

    it "won't move a big disc onto a smaller disc" do
      game.move(tower_0, tower_2)
      expect {game.move(tower_0, tower_2)}.to raise_error(ArgumentError)
    end

    it "won't try to move from an empty spot" do
      expect {game.move(tower_1, tower_2)}.to raise_error(ArgumentError)
    end

  end

  # describe "#play" do 
  #
  # end

end
