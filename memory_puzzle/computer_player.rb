require_relative 'board.rb'

class Computer_Player
    def initialize
        @card_hash = { |h, k| h[k] = [] }
        @matched = []
        @first_guess = true
    end

    def receive_known_card(pos, value)
        @card_hash[value] << pos
        if @card_hash[value].length > 1
            receive_matched(p)
        
    end

    def receive_matched(pos1, pos2)
        matched << pos1, pos2
    end 

    def get_input(board)

        if @card_hash.keys.length == 0
            first_guess = !first_guess
            pos = [rand(0...board.grid.length), rand(0...board.grid.length)]
        end
        if matched.length == 0 

    end
end