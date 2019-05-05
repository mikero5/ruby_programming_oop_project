#
#
#
#
#

class Board
  attr_accessor :current_code
  attr_accessor :current_guess
  attr_reader   :current_clue
  
  def initialize
    @current_code = [0,0,0,0]
    @current_guess = [0,0,0,0]
    @current_clue = ['', '', '', '']
    @turn = 0
  end

  def correct_guess?
    return @current_code == @current_guess.map(&:to_i)
  end
  
  def check_game_over
    retval = false
    if @turn >= 11
      retval = true
    end

    if correct_guess?
      retval = true
    end
    
    @turn += 1
    retval
  end
  
  def display_guess
    puts "Code breaker's last guess: #{@current_guess.map(&:to_i).inspect}"
  end

  def display_code
    puts "              Target code: #{@current_code.inspect}"
  end

  def display_winner
    puts "              Target Code: #{@current_code.inspect}"
    if correct_guess?
      puts ""
      puts "******************"
      puts "Code breaker wins!"
      puts "******************"
      puts ""
    else
      puts ""
      puts "******************"
      puts "Code breaker loses!"
      puts "******************"
      puts ""
    end
  end

  def get_clue
    sec_code = []
    sec_guess = []
    @current_clue = []
    (0..3).each {|i|
      if @current_code[i] == @current_guess[i].to_i
        @current_clue.push('X')
      else
        sec_code.push(@current_code[i])
        sec_guess.push(@current_guess[i])
      end
    }

    (0..sec_code.length-1).each {|i|
      (0..sec_guess.length-1).each {|j|
        if sec_code[i] == sec_guess[j].to_i
          sec_guess.delete_at(j)
          @current_clue.push('O')
          break
        end
      }
    }

    (@current_clue.length..3).each {
      @current_clue.push('-')
    }
    @current_clue
  end
  
  def display_clue
    get_clue
    puts "                     clue: #{@current_clue.inspect} ('X' = symbol & position match, 'O' = symbol match, '-' = no match)"
  end
  
  def display_turn
    puts ""
    puts "--------"
    puts "End of Turn: #{@turn}"
  end
end
