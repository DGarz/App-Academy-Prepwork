class HumanPlayer
  
  attr_reader :name
  attr_accessor :mark
  
  def initialize(name)
    @name = name
  end
  
  def get_move
    puts "Where would you like to move?"
    pos = gets.chomp
    pos.split(", ").map { |el| el.to_i }
  end
  
  def display(board)
    puts "Col   0 1 2"
    board.grid.each_with_index do |row, index| 
      row_array = []
      row.each do |el|
        el.nil? ? row_array << " " : row_array << el
      end
      puts "Row #{index} #{row_array.join("|")}"
    end
  end
end
