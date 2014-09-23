require './scrabble.rb'

describe ScrabbleGame::Scrabble do
  # let Scrabble.new
  describe "#self.score" do
    it "returns a FixNum" do
      expect(ScrabbleGame::Scrabble.score("apple")).to be_instance_of(Fixnum)
    end

    it "returns the same fixnum regardless of case" do
      expect(ScrabbleGame::Scrabble.score("zebra")).to eq(ScrabbleGame::Scrabble.score("ZeBRa"))
    end

    it "gives a value of 1 to 'a'" do
      expect(ScrabbleGame::Scrabble.score("a")).to eq(1)
    end

    context "a word uses 7 letters" do
      it "gives a bonus of 20 points" do
        expect(ScrabbleGame::Scrabble.score("aaaaaaa")).to eq 27
      end
    end

  end

  describe "#self.highest_score_from(array_of_words)" do
    array_of_words = ["meow", "apple", "banjo", "flower", "fuzzy" ]
    let(:best_score) {ScrabbleGame::Scrabble.highest_score_from(array_of_words)}

    it "returns a word from the array input" do
      expect(array_of_words).to include best_score
    end

    it "returns the word with the highest score" do
      expect(best_score).to eq "fuzzy"
    end

    context "two words with the same score" do
      it "chooses the shorter word" do
        expect(ScrabbleGame::Scrabble.highest_score_from(["hoax", "banjo"])).to eq "hoax"
      end
    end

    context "multiple words with same length and score" do
      it "chooses the first word" do
        expect(ScrabbleGame::Scrabble.highest_score_from(["eat", "to", "a", "art"])).to eq "eat"
      end
    end

  end
end
