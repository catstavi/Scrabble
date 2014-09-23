require './board.rb'

describe ScrabbleGame::Board do
  let (:board) {ScrabbleGame::Board.new}

  describe "#board" do
    it "is an array of strings" do
      expect(board.board.sample.sample).to be_instance_of String
    end
  end

  describe "#free_square" do
    context "when indices indicate an availble space" do
      it "returns true" do
        expect(board.free_square?(1,1)).to eq true
      end
    end

    context "when indices indicate a filled space" do
      it "returns false" do
        board.board[8][9] = "[f]"
        expect(board.free_square?(9,8)).to eq false
      end
    end

    context "when indices are off board" do
        it "returns false" do
          expect(board.free_square?(20,20)).to eq false
        end
    end
  end

  describe "#can_play?" do
    context "when word has enough clear squares" do
      it "returns true" do
        expect(board.can_play?("hello",1, 2, :across )).to eq true
      end
    end

    context "when word does not have enough clear squares" do
      it "returns false" do
        board.board[5][0] = "[f]" #fills position 0, 5
        expect(board.can_play?("dragons", 0, 0, :down)).to eq false
      end
    end
  end

end
