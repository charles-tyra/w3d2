require_relative 'board.rb'
require_relative 'card.rb'

class Game
    def initialize()
        @board = Board.new
        @previous_guess
    end

    def play_loop
        while !game_over?
            @board.render
            puts "input position like `row col` with a maximum value of #{@board.length}"
            pos = gets.chomp.split(' ').map{|coord| coord.to_i}
            if pos.length != 2
                raise 'please input a valid position'
            end
            @board.reveal(pos)
            @previous_guess = pos
            @board.render

            puts "please input another position like `row col` with a maximum value of #{@board.length}"
            pos = gets.chomp.split(' ').map{|coord| coord.to_i}

            @board.reveal(pos)
            @board.render

            if !make_guess?(pos)
                sleep(4)
                @board[pos].hide
                @board[@previous_guess].hide
            end
        end
    end 

    def game_over?
        @board.won?
    end

    def make_guess?(pos)
        return @board[pos] == @board[@previous_guess] if pos != @previous_guess
    end
end