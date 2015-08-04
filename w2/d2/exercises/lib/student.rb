class Student

  
  attr_accessor :first_name, :last_name, :courses
  
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @courses = []
  end
  
  def name
    "#{@first_name} #{@last_name}"
  end
  
  def enroll(course)
    if self.courses.any? do |current_course|
      if current_course.conflicts_with?(course)
        raise "This course conflicts with current course"
      end
    end
    else  
      unless course.students.include?(self)
        @courses << course
        course.students << self
      end
    end
  end
    
    
  def course_load
    credit_load = Hash.new(0)
    @courses.each do |course|
      credit_load[course.department] += course.credits
    end
    credit_load
  end

end
