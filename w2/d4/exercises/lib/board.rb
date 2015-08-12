class Board
  
  attr_accessor :grid
  
  def initialize(grid = [Array.new(3), Array.new(3), Array.new(3)])
    @grid = grid 
  end
  
  def place_mark(pos, mark)
    @grid[pos[0]][pos[1]] = mark
  end
  
  def empty?(pos)
    @grid[pos[0]][pos[1]].nil?
  end
  
  def winner
    return :X if check?(:X)
    return :O if check?(:O)
    return :X if check_diagonal?(:X)
    return :O if check_diagonal?(:O)
  end
  
  def over?
    return true if winner == :X || winner == :O
    @grid.flatten.each do |pos| 
      if pos.nil?
        return false
      else
        "It's a tie"
      end
    end
  end
  
  
  private
  
  
  def check?(mark)
    #check rows
    @grid.each do |row|
      if row.count(mark) == @grid.length
        return true
      end
    end
    #check columns
    @grid.transpose.each do |row|
      if row.count(mark) == @grid.length
        return true
      end
    end
    return false
  end
  
  def check_diagonal?(mark)
    left_diagonal = [] 
    right_diagonal = []
    @grid.length.times do |i|
      left_diagonal << @grid[i][i]
      right_diagonal << @grid[i][-(i+1)]
    end
  
    if left_diagonal.count(mark) == @grid.length
      return true
    elsif right_diagonal.count(mark) == @grid.length
      return true
    else
      return false     
    end
  end
end
