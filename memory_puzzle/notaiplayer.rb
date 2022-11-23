require_relative 'board.rb'

class Not_AI_Player
    def initialize
        
    end

    def get_input(board)
        puts "please input a position like `row col`"
        pos = gets.chomp.split(' ').map{|coord| coord.to_i}
    end

    def receive_known_card(pos, value)
    end

    def receive_matched(pos1, pos2)
    end 
end