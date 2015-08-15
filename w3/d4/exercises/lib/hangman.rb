class Hangman
  
  MAX_TURNS = 25
  
  attr_reader :guesser, :referee, :board
  
  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end
  
  def play
    setup
    turns = 0
    until turns == MAX_TURNS || won?
      take_turn
      turns += 1
    end
    
    endgame
    
  end
  
  def won?
    return false if @board.include?("_")
    return true
  end
  
  def setup
    length = @referee.pick_secret_word
    @guesser.register_secret_length(length)
    @board = "_" * length
  end
  
  def take_turn
    guess = @guesser.guess(@board)
    indexes = @referee.check_guess(guess)
    update_board(guess, indexes)
    @guesser.handle_response(guess, indexes)
  end
  
  def update_board(guess, indexes)
    indexes.each do |idx|
      @board[idx] = guess
    end
  end
  
  private
  
  def endgame
    if won?
      puts "Guesser wins"
      puts @board
    else
      puts "YOU LOSE!"
      puts @board
    end
  end
  
end

class HumanPlayer
  
  attr_reader :dictionary
  
  
  def self.dictionize(file_name)
    File.readlines(file_name).map(&:chomp)
  end
  
  attr_accessor :secret_word
  
  def initialize(dictionary)
    @dictionary = dictionary
  end
  
  def pick_secret_word
    puts "What word would you like to pick?"
    word = gets.chomp.to_s
    @secret_word = word 
    @secret_word.length
  end
  
  def guess(board)
    puts board
    print "Pick a letter: "
    letter = gets.chomp
    letter
  end
  
  def check_guess(letter)
    puts "Computer guesses #{letter}"
    puts "At which position does the letter occur?"
    pos = gets.chomp.split(' ')
    indexes = pos.map { |num| num.to_i }
    indexes
  end
  
  def handle_response(guess, indexes)
    puts "Found #{guess} at #{indexes}"
  end
  
  def register_secret_length(length)
    puts "Word is #{length} characters long."
  end
end

class ComputerPlayer
  
  def self.dictionize(file_name)
    File.readlines(file_name).map(&:chomp)
  end
  
  attr_accessor :secret_word
  
  def initialize(dictionary)
    @dictionary = dictionary
  end
  
  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end
  
  def check_guess(letter)
    indexes = []
    @secret_word.each_char.with_index do |let, idx|
        if let == letter
          indexes << idx
        end
      end
    indexes
  end
  
  def guess(board)
    puts board
    ('a'..'z').to_a.sample
  end
  
  def register_secret_length(length)
    @length = length
  end
  
  def handle_response(guess, indexes)
    puts "Found #{guess} at #{indexes}"
  end
end


if $PROGRAM_NAME == __FILE__
  dictionary = HumanPlayer.dictionize('lib/dictionary.txt')
  players = {:guesser => ComputerPlayer.new(dictionary),
  :referee => HumanPlayer.new(dictionary)}
  game = Hangman.new(players).play
end
