class Board
  
  attr_accessor :grid
  
  def self.default_grid 
    Array.new(10) { Array.new(10) }
  end
  
  def initialize(grid = Board.default_grid)
    @grid = grid
  end
  
  def [](pos)
    x, y = pos
    @grid[x][y]
  end
  
  def []=(pos, val)
    x, y = pos 
    @grid[x][y] = val
  end
  
  def count
    ships = 0
    @grid.each_with_index do |row, row_num|
      row.each_with_index do |col, col_num|
        if @grid[row_num][col_num] == :s
          ships += 1
        end
      end
    end
    ships
  end
  
  def empty?(pos = nil)
    if pos.nil?
      if count == 0
        return true
      else
        return false
      end
    end
      
    @grid[pos[0]][pos[1]].nil?
  end
  
  def full?
    @grid.flatten.none?(&:nil?)
  end
        
  def place_random_ship
    raise "Board is full" if self.full? == true
   
    pos = [rand(@grid.size), rand(@grid.size)]
    @grid[pos[0]][pos[1]] = :s if empty?(pos)
  end
 
  def won?
    return true if count == 0
  end
  
end
