#
#
#
#

class Player
  attr_reader :symbol
  attr_writer :move
  
  def initialize(sym)
    @symbol = sym
    @move = '0'
    index = -1
  end

  def validate?(state_array)
    @index = @move.to_i - 1

    if @index < 0 || @index > 8
      return false
    end
    if state_array[@index] != (@index + 1).to_s
      return false
    end
    true
  end
  
  def get_input(state_array)
    retval = state_array
    valid = false
    while !valid
      print "Player #{@symbol} --> enter move: "
      @move = STDIN.gets.chomp
      valid = validate?(state_array)
      if !valid
        puts "Invalid move, pick an available position number, try again..."
      else
        retval[@index] = @symbol
      end
    end
    retval
  end
  
end
