module ScrabbleGame
  class Scrabble

      @@values = {a: 1, b: 3, c: 3, d: 2,
                e: 1, f: 4, g: 2, h: 4,
                i: 1, j: 8, k: 5, l: 1,
                m: 3, n: 1, o: 1, p: 3,
                q: 10, r: 1, s: 1, t: 1,
                u: 1, v: 4, w: 4, x: 8,
                y: 4, z: 10}

    attr_accessor :tile_bag

    def initialize
      @tile_bag = ScrabbleGame::TileBag.new
      @players = []
    end

    def add_player(name)
      @players << ScrabbleGame::Player.new(name)
    end

    def self.score(word)
      word.downcase!
      score = 0
      letters = word.split(//)
      letters.each do |letter|
        score += @@values[letter.to_sym]
      end
      letters.count == 7 ? score += 20 : score
    end

    def self.highest_score_from(array_of_words)
      array_of_words.sort_by! { |word| [-(score(word)), (word.length)] }
      array_of_words.first
    end

  end
end
