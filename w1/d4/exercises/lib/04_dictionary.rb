class Dictionary
  
  def initialize
    @dict = {}
  end
  
  def entries
    @dict
  end
  
  def add(entry)
    if entry.is_a?(Hash)
      @dict.merge!(entry)
    elsif entry.is_a?(String)
      @dict[entry] =nil
    end
  end
    
  def keywords
    @dict.keys.sort
  end
  
  def include?(word)
    @dict.include?(word)
  end
  
  def find(word)
    @dict.select do |k, v| 
      k.include?(word)
    end
  end
  
  def printable
    printout = ""
    @dict.sort.each do |k, v|
      printout << "[#{k}] \"#{v}\"\n"
    end
    printout.chomp
  end
  
end
