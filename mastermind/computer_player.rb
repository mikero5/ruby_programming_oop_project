#
#
#
#

require_relative 'board.rb'

class ComputerPlayer
  def initialize
    @turn = 0
    @choice_array = [*1..6].repeated_permutation(4).to_a

    @board = Board.new
  end

  def get_code
    retval = []
    (1..4).each {
      retval.push(rand(6) + 1)
    }

    retval
  end

  def prune(clue)
    @choice_array.each {|el|
      @board.current_code = el
      if @board.get_clue != clue
        @choice_array.delete(el)
      end
    }
  end
  
  def get_next_guess(current_clue_array, current_guess_array)
    @board.current_guess = current_guess_array
    retval = []
    if @turn == 0
      retval = ['1','1','2','2']
    else
      prune(current_clue_array)
      retval = @choice_array[0].map(&:to_s)
    end
    @turn += 1
    
    retval
  end
end
