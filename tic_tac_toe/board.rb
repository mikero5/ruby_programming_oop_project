# 
# 
# 
# 

class Board
  def initialize(board_numbers)
    @board_numbers = board_numbers
  end
  
  def draw(state_array)
    disp_array = []
    if @board_numbers
      disp_array = state_array
    else
      disp_array = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      index = 0
      state_array.each {|el|
        if el == 'X' || el == 'O'
          disp_array[index] = el
        end
        index += 1
      }
    end
    
    puts ""
    puts "   #{disp_array[0]}   |   #{disp_array[1]}   |   #{disp_array[2]}   "
    puts "-------+-------+-------"
    puts "   #{disp_array[3]}   |   #{disp_array[4]}   |   #{disp_array[5]}   "
    puts "-------+-------+-------"
    puts "   #{disp_array[6]}   |   #{disp_array[7]}   |   #{disp_array[8]}   "
    puts ""
  end
end
