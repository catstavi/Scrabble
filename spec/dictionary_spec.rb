require './dictionary.rb'

describe ScrabbleGame::Dictionary do
  let (:dict) { ScrabbleGame::Dictionary.new("moo") }
  describe 'word_list' do
    it "is an array" do
      expect(dict.word_list).to be_instance_of Array
    end

     it "is an array of words" do
       expect(dict.word_list.sample).to be_instance_of String
     end
   end

  describe '#is_word?' do
    context "the word is in dictionary's list" do
      it "returns true" do
        expect(dict.is_word? "hat").to eq true
      end

      it "returns true with any capitalization" do
        expect(dict.is_word? "HAT").to eq true
      end
    end

    context "the string is not in the dictionary's list" do
      it "returns false" do
        expect(dict.is_word? "ffthpl").to eq false
      end
    end
  end
end
