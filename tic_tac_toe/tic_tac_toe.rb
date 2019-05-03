# 
# Tic Tac Toe
# 
# 
# Board display:
# 
#    1  |  2  |  3   
# ------+-----+------
#    4  |  5  |  6   
# ------+-----+------
#    7  |  8  |  9   
# 

require_relative 'player.rb'
require_relative 'board.rb'

#################
# Modify String
#################
class String
  def numeric?
    Float(self) != nil rescue false
  end
end
#################

class TicTacToe
  attr_accessor :state_array

  def initialize(board_numbers)
    @state_array = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = Board.new(board_numbers)
  end

  def next_turn
    if @current_player == @player_x
      @current_player = @player_o
    else
      @current_player = @player_x
    end
  end

  def winner
    retval = false
    if @state_array[0] == @state_array[1] && @state_array[1] == @state_array[2]
      retval = @state_array[0] == 'X' ? @player_x : @player_o

    elsif @state_array[3] == @state_array[4] && @state_array[4] == @state_array[5]
      retval = @state_array[3] == 'X' ? @player_x : @player_o

    elsif @state_array[6] == @state_array[7] && @state_array[7] == @state_array[8]
      retval = @state_array[6] == 'X' ? @player_x : @player_o

    elsif @state_array[0] == @state_array[3] && @state_array[3] == @state_array[6]
      retval = @state_array[0] == 'X' ? @player_x : @player_o

    elsif @state_array[1] == @state_array[4] && @state_array[4] == @state_array[7]
      retval = @state_array[1] == 'X' ? @player_x : @player_o

    elsif @state_array[2] == @state_array[5] && @state_array[5] == @state_array[8]
      retval = @state_array[2] == 'X' ? @player_x : @player_o

    elsif @state_array[0] == @state_array[4] && @state_array[4] == @state_array[8]
      retval = @state_array[0] == 'X' ? @player_x : @player_o

    elsif @state_array[2] == @state_array[4] && @state_array[4] == @state_array[6]
      retval = @state_array[2] == 'X' ? @player_x : @player_o

    else
      retval = 'tie'
      @state_array.each {|el|
        if el.numeric?
          retval = false
        end
      }
    end
    retval
  end
    
  def run
    puts "Tic Tac Toe\n-----------\n"
    @current_player = @player_x
    while !@game_over
      @board.draw(@state_array)
      @state_array = @current_player.get_input(@state_array)
      @game_over = winner
      next_turn
    end

    @board.draw(@state_array)
    if @game_over == @player_x
      puts "*** Player X wins! ***"
    elsif @game_over == @player_o
      puts "*** Player O wins! ***"
    else
      puts "*** Tie Game! ***"
    end
    puts ""
  end
  
  
end

use_board_numbers = true
input_array = ARGV
if input_array.length > 0
  if input_array[0] == 'c' || input_array[0] == 'C'
    use_board_numbers = false
  end
end
game = TicTacToe.new(use_board_numbers)
game.run
