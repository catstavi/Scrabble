module ScrabbleGame
  class Dictionary
    #require 'words'
    attr_reader :word_list

    def initialize(word_file)
      @word_list = ["meow", "hat", "love", "growl", "dinosaur"]
    #  @word_list = parse_file(word_file)
    end

    def parse_file
      #loads a file of words to make an array of recognized words
    end

      def is_word?(word)
      @word_list.include? word.downcase
    end
  end

end
