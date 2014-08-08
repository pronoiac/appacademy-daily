class Student
  def initialize(first_name, last_name)
    @first_name   = first_name
    @last_name    = last_name
    @courses      = []
  end

  def name
    @first_name.capitalize + " " + @last_name.capitalize
  end

  def courses
    results       = []
    @courses.each do |course|
      results << course.course_name
    end
    results
  end

  def enroll(course) 
    return if @courses.include?(course)
    if has_conflict?(course)
      return false
    end
    @courses.push(course) 
    course.add_student(self)
    true
  end

  def course_load
    itinerary     = Hash.new(0) # filled with 0 not nil; can auto-add dept total. 
    @courses.each do |course|
      itinerary[course.department] += course.num_credits
    end
    itinerary
  end
  
  def has_conflict?(new_course)
    @courses.each do |course|
      next unless course.timeblock == new_course.timeblock
      course.days.each do |day|
        return true if new_course.days.include?(day)
      end
    end
    false
  end
end # Student

class Course
  attr_reader :department, :num_credits, :course_name, :days, :timeblock

  def initialize(course_name, department, num_credits, options= {} )
    defaults = {
      :days => [],
      :timeblock => 0
    }
    @course_name  = course_name
    @department   = department
    @num_credits  = num_credits
    @student_list = []
    options = defaults.merge(options)
    @days = options[:days]
    @timeblock = options[:timeblock]
    
  end

  def students
    results       = []
    @student_list.each do |student|
      results << student.name
    end
    results
  end

  def add_student(student)
    return if @student_list.include?(student)
    @student_list << student
    student.enroll(self)
  end
  
  def conflicts_with?(course2)
    unless @timeblock == course2.timeblock 
      return false
    end
    @days.each do |day|
      return true if course2.days.include?(day)
    end
    return false
  end
end

# testing.
puts "Testing student initialize" 
student1          = Student.new("Billy Bob", "Thornton")
student2          = Student.new("Diet", "Coke")

puts "Testing student name"
p student1.name
p student2.name

puts "Testing course creation"
# course1           = Course.new("English", "Language", 5)
# course2           = Course.new("Physics", "Science", 5)
course1 = Course.new("English", "Language", 5, 
  {:days => [:mon, :wed, :fri], :timeblock => 1})
course2 = Course.new("Physics", "Science", 5, 
  {:days => [:tue, :thu], :timeblock => 2})
course3 = Course.new("Algebra", "Math", 3,
  {:days => [:wed], :timeblock => 1})


puts "Testing student enroll"
student1.enroll course1
student2.enroll course2

puts "Testing student list courses"
p student1.courses
p student2.courses

puts "Testing student course load"
p student1.course_load
p student2.course_load

puts "Testing Course list students"
p course1.students
p course2.students

puts "Testing course add student"
course2.add_student(student1)
p course2.students

puts "Testing course schedule conflict..."
p course1.conflicts_with?(course2)
p course1.conflicts_with?(course3)

puts "Testing student schedule conflict"
p student1.has_conflict?(course3)
p student2.has_conflict?(course3)

puts "Testing enroll with conflict"
p student1.enroll(course3)