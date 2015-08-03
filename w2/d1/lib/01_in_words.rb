Ones = { 0 => "zero",1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
         6 => "six", 7  => "seven", 8 => "eight", 9 =>  "nine"}
    
Teens = { 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 
          15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
          19 => "nineteen"}
          
Tens = {  20 => "twenty", 30 => "thirty", 40 => "forty", 
          50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 
          90 => "ninety"}
    



class Fixnum
  
  def in_words
    if self < 10
      Ones[self]
    elsif self < 20
      Teens[self]
    elsif self < 100
      num_under_hun(self)
    elsif self < 1000
      num_in_huns(self)
    elsif self < 1_000_000
      num_in_thou(self)
    elsif self < 1_000_000_000
      num_in_mils(self)
    elsif self < 1_000_000_000_000
      num_in_bils(self)
    elsif self < 1_000_000_000_000_000
      num_in_trils(self)
    end
  end
  
  private
  
  def num_under_hun(num)
    if self%10 == 0
        Tens[self]
    else
        "#{Tens[self/10 * 10]} #{Ones[self%10]}"
    end
  end
  
  def num_in_huns(num)
    if self% 100 !=0
      "#{Ones[self/100]} hundred #{(self%100).in_words}"
    else
      "#{Ones[self/100]} hundred"
    end
  end
  
  def num_in_thou(num)
    if num%100 == 0
      "#{(num/1000).in_words} thousand"
    else
      "#{(num/1000).in_words} thousand #{(num%1000).in_words}"
    end
  end
  
  def num_in_mils(num)
    if num % 1_000_000 == 0
      "#{(num/1_000_000).in_words} million"
    else
      "#{(num/1_000_000).in_words} million #{(num%1_000_000).in_words}"
    end
  end
  
  def num_in_bils(num)
    if num % 1_000_000_000 == 0
      "#{(num/1_000_000_000).in_words} billion"
    else
      "#{(num/1_000_000_000).in_words} billion #{(num%1_000_000_000).in_words}"
    end
  end
  
  def num_in_trils(num)
    if num % 1_000_000_000_000 == 0
      "#{(num/1_000_000_000_000).in_words} trillion"
    else
      "#{(num/1_000_000_000_000).in_words} trillion #{(num%1_000_000_000_000).in_words}"
    end
  end
    
end