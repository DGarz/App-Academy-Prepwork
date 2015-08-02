class Timer
  
  attr_accessor :seconds
  
  def initialize(sec = 0)
    @seconds = sec
  end
  
  def time_string
    array = []
    hr = @seconds/3600
    min = (@seconds - (hr*3600)) / 60 
    sec = (@seconds - (hr*3600) - (min * 60))
    
    hr < 10 ? array << "0" + hr.to_s : array << hr
    min < 10 ? array << "0" + min.to_s : array << min
    sec < 10 ? array << "0" + sec.to_s : array << sec
    
    array.join(':')
  end
end