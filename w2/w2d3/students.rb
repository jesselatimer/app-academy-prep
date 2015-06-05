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
