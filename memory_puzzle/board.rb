require_relative 'card.rb'
class Board
    attr_reader :size
    def initialize(n = 4)
        raise "board must be even >:(!!!" if n.odd?
        raise "board must have less than 52 spaces!!" if n > 6 
        @grid = Array.new(n) { Array.new(n) }
        @size = n * n
    end

    def populate
        alphabet_whatever = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        remaining_pairs = @size / 2
        max = @grid.length
        card_placed = 0
        while remaining_pairs > 0
            current_card = alphabet_whatever[rand(0 ... alphabet_whatever.length)]
            alphabet_whatever[alphabet_whatever.index(current_card)] = ""
            while card_placed < 2
                samp_row, samp_col = (0...max).rand, (0...max).rand
                if @grid[samp_row][samp_col] == nil
                    @grid[samp_row][samp_col] = Card.new(current_card)
                    card_placed += 1
                end
                remaining_pairs -= 1
            end
        end
    end

    def render()
        @grid.each {|row| puts row.join(' ')}
    end
end