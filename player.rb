module ScrabbleGame
  class Player
    attr_accessor :name, :plays, :total_score, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      #all players should share the same tile_bag for a given game I think
      #this code is started in Scrabble class, but for now (testing) I will put one
      #tilebag per player
      @tiles = []
    end

    def draw_tiles(tile_bag)
      num_to_draw = 7 - @tiles.count
      @tiles += tile_bag.draw_tiles(num_to_draw)
    end

    def play(word)
      @plays << word
      @total_score += ScrabbleGame::Scrabble.score(word)
      if won? then return false end
    end

    def won?
      @total_score>100 ? true : false
    end

    def highest_scoring_word
      ScrabbleGame::Scrabble.highest_score_from(@plays)
    end

    def highest_word_score
      highest_scoring_word ? ScrabbleGame::Scrabble.score(highest_scoring_word) : nil
    end

  end
end
