class Book
  
  attr_reader :title
  
  
  def title=(title)
    words = title.split(" ")
    titled = []
    articles = %w(a for and the an to of in)
    
    words.each_with_index do |word, idx|
      if idx == 0 
        titled << word.capitalize
      elsif articles.include?(word)
        titled << word
      else
        titled << word.capitalize
      end
    end
    @title= titled.join(' ')
  end
end
