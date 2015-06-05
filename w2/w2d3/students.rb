class Student

  attr_reader :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(*courses_for_enrollment)
    courses_for_enrollment.each do |course|
      @courses << course
      course.add_student(self) unless course.students.include?(self)
    end
  end

  def courses_by_name
    @courses.map { |course| course.name }
  end

  def course_load
    depts_and_credits = Hash.new(0)
    @courses.each do |course|
      depts_and_credits[course.dept] += course.credits
    end
    depts_and_credits
  end

end

class Course

  attr_reader :name, :dept, :credits, :students

  def initialize(name, dept, credits)
    @name = name
    @dept = dept
    @credits = credits
    @students = []
  end

  def students_by_name
    @students.map { |student| student.name }
  end

  def add_student(student)
    @students << student
  end

end

hist101 = Course.new("History for Dummies", "HIST", 4)
math101 = Course.new("Introduction to Algebra", "MATH", 4)
math403 = Course.new("Really Hard Math for Science", "MATH", 4)
jesselatimer = Student.new("Jesse", "Latimer")
lizcarr = Student.new("Liz", "Carr")

puts jesselatimer.name                # => Jesse Latimer
puts jesselatimer.courses_by_name     # => empty
jesselatimer.enroll(hist101)          # =>
puts jesselatimer.courses_by_name     # => History for Dummies
puts hist101.students_by_name         # => Jesse Latimer
lizcarr.enroll(hist101)
lizcarr.enroll(math101, math403)
puts lizcarr.courses_by_name
puts hist101.students_by_name
puts lizcarr.course_load
