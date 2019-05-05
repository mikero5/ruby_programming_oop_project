# 
# Mastermind game
# 
# 

require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Mastermind
  def initialize
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
    @coder = @computer
    @breaker = @human
    @board = Board.new
  end

  def splash
    puts ""
    puts "***********************"
    puts "Mastermind Game (clone)"
    puts "***********************"
    puts ""
    puts ""
  end

  def get_mode
    valid = false
    input = 'G'
    retval = ''
    while !valid
      print "Do you want to guess the code or write the code [G/W]: "
      input = STDIN.gets.chomp
      if input.upcase == 'G' || input.upcase == 'W'
        valid = true
        if input.upcase == 'G'
          retval = 'breaker'
        else
          retval = 'coder'
        end
      else
        puts "Please enter 'G' or 'W', try again..."
      end
    end
    retval
  end

  def run
    splash
    mode = get_mode
    if mode == 'coder' # player writes the code
      @coder = @human
      @breaker = @computer
    end
    @board.current_code = @coder.get_code
#    puts "@board.current_code: #{@board.current_code}"

    game_over = false
    while !game_over
      @board.current_guess = @breaker.get_next_guess(@board.current_clue, @board.current_guess)
      game_over = @board.check_game_over
      @board.display_turn
      @board.display_guess
      @board.display_clue if !game_over
    end
    @board.display_winner
  end
end


game = Mastermind.new
game.run
