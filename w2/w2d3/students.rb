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
      if has_conflict?(course)
        raise "#{course.name} conflicts with another class"
        next
      end
      @courses << course
      course.add_student(self)
    end
  end

  def has_conflict?(new_course)
    @courses.each do |current_course|
      return true if new_course.conflicts_with?(current_course)
    end
    false
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

  attr_reader :name, :dept, :credits, :students, :days, :block

  def initialize(name, dept, credits, days, block)
    @name = name
    @dept = dept
    @credits = credits
    @days = days
    @block = block
    @students = []
  end

  def students_by_name
    @students.map { |student| student.name }
  end

  def add_student(student)
    @students << student
  end

  def conflicts_with?(course)
    @days.each do |day|
      return true if course.days.include?(day) && @block == course.block
    end
    false
  end

end
