require_relative 'card.rb'
require 'byebug'
class Board
    attr_reader :size, :grid
    def initialize(n = 4)
        raise "board must be even >:(!!!" if n.odd?
        raise "board must have less than 52 spaces!!" if n > 6 
        @grid = Array.new(n) { Array.new(n, Card.new(nil)) }
        @size = n * n
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end
    
    def populate
        alphabet_whatever = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        remaining_pairs = @size / 2
        max = @grid.length
        card_placed = 0

        while remaining_pairs > 0
            current_card = alphabet_whatever[rand(alphabet_whatever.length)]
            alphabet_whatever[alphabet_whatever.index(current_card)] = ""
            puts "current card" + current_card.to_s
            while card_placed < 2
                samp_row, samp_col = rand(max), rand(max)
            
                if @grid[samp_row][samp_col].cheat == nil
                    puts "row, col" + samp_row.to_s + samp_col.to_s
                    @grid[samp_row][samp_col] = Card.new(current_card)
                    card_placed += 1
                    puts "card placed" + card_placed.to_s
                end
            end
            remaining_pairs -= 1
            puts "remaining pairs" + remaining_pairs.to_s
            card_placed = 0
        end
    end

    def render()
        @grid.each {|row| puts row.join(' ')}
    end

    def reveal(pos)
        if @grid[pos[0]][pos[1]].value == " "
            @grid[pos[0]][pos[1]].reveal
        end
        return @grid[pos[0]][pos[1]].value
    end

    def won?
        @grid.all? {|row| row.all?{|pos| pos != " "}}
    end
end