require './tilebag.rb'

describe ScrabbleGame::TileBag do
  let(:tilebag) { ScrabbleGame::TileBag.new }

  describe '#new' do
    it "initializes with default tiles" do
      expect(tilebag).to respond_to(:default_tiles)
    end
  end

  describe '#draw_tiles' do
    it "returns an array" do
      expect(tilebag.draw_tiles(3)).to be_instance_of(Array)
    end

    it "returns an array the same size passed to the method" do
      expect(tilebag.draw_tiles(3).count).to eq 3
    end

    it "removes tiles from the default set" do
      tilebag.draw_tiles(6)
      expect(tilebag.default_tiles.count).to eq 92
    end
  end

  describe "#tiles_remaining" do
    it "returns a Fixnum" do
      expect(tilebag.tiles_remaining).to be_instance_of(Fixnum)
    end

    context "when there are no tiles taken" do
      it "returns the full number of tiles" do
        expect(tilebag.tiles_remaining).to eq 98
      end
    end

    context "when there are 10 tiles drawn" do
      it "returns the remaining tiles" do
        tilebag.draw_tiles(10)
        expect(tilebag.tiles_remaining).to eq 88
      end
    end
  end



end
