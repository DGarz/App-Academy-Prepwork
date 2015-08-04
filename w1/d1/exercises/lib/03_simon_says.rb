def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, num = 2)
  ((word + " ") * num).strip
end

def start_of_word(word, num = 1)
  word[0..num-1]
end

def first_word(string)
  string.split(" ").first
end

def titleize(string)            ## refactor titleize
  stop_words = %w(and of for over the)
  title = []
  words = string.split(" ")
  
  words.each do |word|
    if title.empty?
      title << word.capitalize
    elsif stop_words.include?(word)
      title << word
    else
      title << word.capitalize
    end
  end
  title.join(' ')
end