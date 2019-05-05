#
#
#
#

class HumanPlayer
  def initialize
    @code = [0,0,0,0]
  end

  def get_code
    valid = false
    while !valid
      print "Enter code of 4 space-separated numbers between 1-6: "
      code = STDIN.gets.chomp
      valid = validate?(code)
      if !valid
        puts "Please enter 4 space-separated numbers between 1-6, try again..."
      end
    end
    @code.map(&:to_i)
  end

  def get_next_guess(current_clue_array, current_guess_array)
    valid = false
    while !valid
      print "Enter guess of 4 space-separated numbers between 1-6: "
      guess = STDIN.gets.chomp
      valid = validate?(guess)
      if !valid
        puts "Please enter 4 space-separated numbers between 1-6, try again..."
      end
    end
    @code
  end

  private
  def validate?(code_str)
    retval = true
    @code = code_str.split(' ')
    
    if @code.length != 4
      retval = false
    end

    @code.each {|el|
      if el.to_i < 1 || el.to_i > 6
        retval = false
      end
    }
    
    retval
  end
end
