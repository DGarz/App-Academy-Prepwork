class RPNCalculator
  
  def initialize
    @calculator = []
  end
  
  def push(num)
    @calculator << num
  end
  
  def plus
      calculate(:+)
  end
    
  def minus
      calculate(:-)
  end
    
  def divide
      calculate(:/)
  end
    
  def times
      calculate(:*)
  end
        
  def value
      @calculator.last
  end
    
  def tokens(string)
      stop_syms = %w(+ - * / )
      string.split(" ").map do |x| 
          stop_syms.include?(x) ? x.to_sym : x.to_i
      end
  end
        
  def evaluate(string)
      (tokens(string)).each do |x|
        if x == :+
            plus
        elsif x == :-
            minus
        elsif x == :/
            divide
        elsif x == :*
            times
        else
            @calculator << x
        end
      end
    return value
  end
    
  private
    
  def calculate(method)
      raise 'calculator is empty' if @calculator.length <=1
      value = @calculator[-2].to_f.send(method, @calculator[-1])   ## Cool! Use send method for inserting a method and arguments
      @calculator.delete_at(-2)
      @calculator.delete_at(-1)
      @calculator << value
  end
end
