class Temperature
  
  def initialize(hash = {})
    @temp = hash
  end
  
  def in_fahrenheit
    if @temp.include?(:f)
      @temp[:f]
    else
      @temp[:f] = @temp[:c] * 9/5.0 + 32
    end
  end
  
  def in_celsius
    if @temp.include?(:c)
      @temp[:c]
    else
      @temp[:c] = (@temp[:f] - 32) * 5/9.0
    end
  end
  
  def self.from_celsius(deg)
    self.new(:c => deg)
  end
  
  def self.from_fahrenheit(deg)
    self.new(:f => deg)
  end
end

class Fahrenheit < Temperature
  
  def initialize(deg)
    @temp = {:f => deg}
  end
end

class Celsius < Temperature
  
  def initialize(deg)
    @temp = {:c => deg}
  end
end
