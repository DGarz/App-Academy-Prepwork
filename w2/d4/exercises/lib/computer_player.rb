class ComputerPlayer
   
  attr_reader :name, :board
  attr_accessor :mark
  
  def initialize(name)
     @name = name
  end
  
  def display(board)
    @board = board     
  end
    
  def get_move
    spaces = []
    @board.grid.each_with_index do |row, idx|
      row.each_with_index do |el, idx2|
        if @board.empty?([idx, idx2])
          spaces << [idx, idx2]
        end
      end
    end
      
    spaces.each do |pos|
      @board.place_mark(pos, @mark)
      if @board.winner
        return pos
      else
        @board.grid[pos[0]][pos[1]] = nil
      end
    end

    
    return spaces.sample                     
  end
end
