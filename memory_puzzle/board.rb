class Board
    attr_reader :size
    def initialize(n = 4)
        raise "board must be even >:(!!!" if n.odd?
        
        @grid = Array.new(n) { Array.new(n) }
        @size = n * n
    end

    def populate
        remaining_pairs = @size / 2
        max = @grid.length
        card_placed = false
        while remaining_pairs > 0
            current_card = ("A".."Z").sample
            while !card_placed
                samp_row, samp_col = (0...max).rand, (0...max).rand
                if @grid[samp_row][samp_col] == nil
                    @grid[samp_row][samp_col] = Card.new(current_card)
                    card_placed = true
                end
            end
            card_placed = false
            while
        end
        
        @grid.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                @grid[i][j] = Card.new(("a".."z").sample)
            end
        end
    end
end