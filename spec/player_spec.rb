require './player.rb'

describe ScrabbleGame::Player do
  let(:player) {ScrabbleGame::Player.new("Leo")}
  describe "#self.new" do
    it "returns a Player instance" do
      expect(player).to be_instance_of(ScrabbleGame::Player)
    end

    it "assigns the name passed to an instance vairable @name" do
      expect(player.name).to eq "Leo"
    end
  end

  describe "#plays" do
    it "is an array of words" do
      expect(player.plays.class).to eq Array
    end
  end

  describe "#play(word)" do
    it "adds the word to the plays array" do
      player.play("hat")
      expect(player.plays).to include("hat")
    end

    context "when player has won" do
      it "returns false " do
        player.total_score = 101
        expect(player.play("art")).to eq false
      end
    end
  end

  describe "tiles" do
    it "is an array" do
      expect(player.tiles).to be_instance_of Array
    end

    it "is less than 8" do
      expect(player.tiles.count).to be < 8
    end

    context "when there are tiles (not empty)" do
      it "contains letters (in the array)" do
        player.draw_tiles(ScrabbleGame::Scrabble.new.tile_bag)
        expect(player.tiles.sample).to be_instance_of String
      end
    end
  end

  describe "#draw_tiles" do
    it "fills the tiles attr until 7" do
      player.draw_tiles(ScrabbleGame::Scrabble.new.tile_bag)
      expect(player.tiles.count).to eq 7
    end

    it "files tiles with string with a lenghth of 1" do
      player.draw_tiles(ScrabbleGame::Scrabble.new.tile_bag)
      expect(player.tiles.sample.length).to eq 1
    end

  end

  describe "#total_score" do
    context "when player has played no words" do
      it "returns 0 as score" do
        expect(player.total_score).to eq 0
      end
    end

    context "when player has played some words" do
      it "returns the total score of those words" do
        player.play("hat")
        player.play("fuzzy")
        expect(player.total_score).to eq 35
      end
    end
  end

  describe "#won?" do
    context "when player has score less than or equal to 100" do
      it "returns false" do
        expect(player.won?).to eq false
      end
    end

    context "when player has score over 100" do
      it "returns true" do
        player.total_score = 101
        expect(player.won?).to eq true
      end
    end
  end

  describe "#highest_scoring_word" do
    context "when the player hasn't played any words" do
      it "returns nil" do
        expect(player.highest_scoring_word).to eq nil
      end
    end

    context "when the player has played only 'hat'" do
      it "returns 'hat'" do
        player.play("hat")
        expect(player.highest_scoring_word).to eq "hat"
      end
    end

    context "when the player has played multiple words" do
      it "returns the word with the highest score" do
        player.plays += ["hat", "fuzzy", "flower", "fan"]
        expect(player.highest_scoring_word).to eq "fuzzy"
      end
    end
  end

  describe "#highest_word_score" do
  context "when the player hasn't played any words" do
      it "returns nil" do
        expect(player.highest_word_score).to eq nil
      end
    end

    context "when the player has played only one word" do
      it "returns the score of that word" do
        player.play("hat")
        expect(player.highest_word_score).to eq 6
      end
    end

    context "when the player has played multiple words" do
      it "returns the score of the highest word" do
        player.plays += ["hat", "fuzzy", "flower", "fan"]
        expect(player.highest_word_score).to eq 29
      end
    end
  end
end
