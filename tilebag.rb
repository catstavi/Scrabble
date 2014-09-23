module ScrabbleGame
  class TileBag
    attr_reader :default_tiles

    def initialize
      @default_tiles = []
      fill_tilebag
    end

    def fill_tilebag
      tile_count = {a: 9, b: 2, c: 2, d: 4,
                    e: 12, f: 2, g: 3, h: 2,
                    i: 9, j: 1, k: 1, l: 4,
                    m: 2, n: 6, o: 8, p: 2,
                    q: 1, r: 6, s: 4, t: 6,
                    u: 4, v: 2, w: 2, x: 1,
                    y: 2, z: 1}
      tile_count.each do |k, v|
        v.times do @default_tiles << k.to_s
        end
      end
    end

    def draw_a_tile
      tile = @default_tiles.sample
      tile_index = @default_tiles.find_index(tile)
      @default_tiles.delete_at(tile_index)
      tile
    end

    def draw_tiles(n)
      tile_list = []
      n.times do
        tile_list << draw_a_tile
      end
      tile_list
    end

    def tiles_remaining
      @default_tiles.count
    end

  end
end
