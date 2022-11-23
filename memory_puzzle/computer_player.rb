require_relative 'board.rb'

class Computer_Player
    def initialize
        @card_hash = { |h, k| h[k] = [] }
        @matched = []
        @first_guess = " "
        @currval = ""
    end

    def receive_known_card(pos, value)
        @card_hash[value] << pos
        @currval = value
    end

    def receive_matched(pos1, pos2)
        @matched << [pos1, pos2]
    end 

    def has_match?(val)
        @card_hash.has_key?(val)
    end

    def get_known_valid_pairs
        pairs = @card_hash.values.select{|arr| arr.length > 1}
        pairs.reject!{|arr| @matched.include?(arr)}
        pairs
    end

    def get_random_guess(board)
        pos = [rand(0...board.grid.length), rand(0...board.grid.length)]
    end

    def first_guess(board)
        valid_pairs = get_known_valid_pairs
        if valid_pairs.length > 0
            return valid_pairs[0][0]
        else
            return get_random_guess(board)
        end
    end

    def second_guess(board)
        valid_pairs = get_known_valid_pairs
        if valid_pairs.length > 0
            return valid_pairs[0][1]
        elsif @card_hash[@currval].length > 1
            return @card_hash[@currval][0]
        else
            return get_random_guess
        end
    end

    def get_input(board)
        if @first_guess == " "
            @first_guess = first_guess(board)
            return @first_guess
        else
            second = second_guess(board)
            @first_guess = " "
            return second
        end

        # valid_pairs = get_known_valid_pairs
        # if valid_pairs.length > 0 && 

        
        # if @first_guess == " "
        #     pos = get_random_guess(board)
        #     @first_guess = pos
        # else
        #     @first_guess = " "
        # end
    end
end