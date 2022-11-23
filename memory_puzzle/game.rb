require_relative 'board.rb'
require_relative 'card.rb'
require_relative 'notaiplayer.rb'
require_relative 'computer_player.rb"'

class Game
    def initialize(player = Not_AI_Player.new)
        @board = Board.new
        @board.populate
        @previous_guess
        @player = player
    end

    def play_loop
        while !game_over?
            @board.render
            pos = @player.get_input
            if pos.length != 2
                raise 'please input a valid position'
            end
            @board.reveal(pos)
            @player.receive_known_card(pos, @board[pos].value)
            @previous_guess = pos
            @board.render

            pos = @player.get_input
            @board.reveal(pos)
            @player.receive_known_card(pos, @board[pos].value)
            @board.render
            if !make_guess?(pos)
                sleep(3)
                @board[pos].hide
                @board[@previous_guess].hide
            end
            system("clear")
        end
        p "YOU WON"
    end 

    def game_over?
        @board.won?
    end

    def make_guess?(pos)
        return @board[pos] == @board[@previous_guess] if pos != @previous_guess
    end
end