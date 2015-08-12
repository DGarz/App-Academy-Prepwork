class HumanPlayer
    
    attr_reader :name
    
    def initialize(name)
        @name = name
    end
    
    def get_play
      puts "Where would you like to bomb next?"
      puts "Row?"
      row = gets.chomp
      puts "Column?"
      col = get.chomp
      return [row, col]
    end
end
