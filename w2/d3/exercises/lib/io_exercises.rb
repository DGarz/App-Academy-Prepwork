# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  game_number = rand(1..100)
  guesses = 0
  guess = nil
  until won?(guess, game_number)
    guesses += 1
    puts "Guess a number"
    guess = gets.chomp.to_i
    puts "#{guess}"
    puts "number of guesses #{guesses}"
    
    analyze(guess, game_number)
    won?(guess, game_number)
  end
end

private

def won?(guess, game_num)
   return true if guess == game_num
   return false
end

def analyze(guess, game_num)
  if guess == game_num
    return "Congratulations you guessed the number!"
  end
  guess < game_num ? (puts "too low") : (puts "too high")
end

public

def shuffle_file(filename)
  basename = File.basename(filename, ".*")
  ext = File.extname(filename)
  File.new("#{basename}--shuffled#{ext}", "w") do |f|
    File.readlines(filename).shuffle.each do |line|
      f.puts line.chomp
    end
  end
end
  
  
if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    shuffle_file(ARGV.shift)
  else
    puts "ENTER FILENAME TO SHUFFLE:"
    filename = gets.chomp
    shuffle_file(filename)
  end
end