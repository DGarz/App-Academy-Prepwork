class Code
  attr_reader :pegs
  
  PEGS = {  "B" => :blue,
            "G" => :green,
            "Y" => :yellow,
            "O" => :orange,
            "R" => :red,
            "P" => :purple
  }
  
  def initialize(pegs)
    unless pegs.is_a?(Array)
      raise ArgumentError
    else
      @pegs = pegs
    end
  end
  
  
  def [](idx)
    @pegs[idx]
  end
  
  
  def self.parse(string)
    pegs = []
    string.each_char do |char| 
      raise "Invalid color" unless PEGS.has_key?(char.upcase)
      
      pegs << char.upcase
    
    end
    Code.new(pegs)
  end
  
  
  def self.random
    pegs = []
    4.times do 
      pegs << PEGS.keys.sample
    end
    Code.new(pegs)
  end
  
  
  def near_matches(code)
    pegs = self.pegs
    other_pegs = code.pegs
    matches = Hash.new(0)
    sum = 0
    (0...other_pegs.length).each do |idx|
      matches[code[idx]] = [other_pegs.count(code[idx]), pegs.count(code[idx])].min
    end
    matches.each_value { |val| sum += val }
    sum - exact_matches(code)
  end
  
   
  def exact_matches(code)
    matches = 0
    (0...self.pegs.length).each do |idx|
      if self[idx] == code[idx]
        matches += 1
      end
    end
    matches
  end
  
  
  def ==(code)
    return false unless code.is_a?(Code)
    
    self.pegs == code.pegs
  end
end


class Game
  
  MAX_TURNS = 10
  
  attr_reader :secret_code
  
  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end
  
  def play
    puts "Welcome to Mastermind"
    puts "Please form a four letter code using the first letter of these colors:"
    puts "#{Code::PEGS}"
    MAX_TURNS.times do
      guess = get_guess 
      if guess == @secret_code
        puts "You've won"
        return
      end
      
      display_matches(guess)
    end
    puts "You're a loser! Try again next time!"
  end
  
  #def get_guess
    #puts "Guess the code:"

    #begin
      #Code.parse(gets.chomp)
    #rescue
      #puts "Error parsing code!"
      #retry
    #end
  #end
  #why does above get_guess work but not mine?
  def get_guess
    puts "What is your guess?"
    guess = $stdin.gets.chomp
    return Code.parse(guess)
  end
  
  def display_matches(code)
    exact = @secret_code.exact_matches(code)
    near = @secret_code.near_matches(code)
    
    puts "You have #{exact} exact matches"
    puts "You have #{near} near matches"
  end
end


if $PROGRAM_NAME == __FILE__
  Game.new.play
end