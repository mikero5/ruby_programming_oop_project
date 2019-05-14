#require_relative 'player.rb'
#require_relative 'board.rb'
require_relative 'tic_tac_toe.rb'

use_board_numbers = true
input_array = ARGV
if input_array.length > 0
  if input_array[0] == 'c' || input_array[0] == 'C'
    use_board_numbers = false
  end
end
game = TicTacToe.new(use_board_numbers)
game.run
