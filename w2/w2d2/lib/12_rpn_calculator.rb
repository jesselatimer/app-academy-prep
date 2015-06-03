# Written by Jesse Latimer and Darren Tan for App Academy Prep

class RPNCalculator
  
  def initialize
      @calc_stack = []
      file_name = ARGV[0]
      p file_name
      evaluate_file(file_name) unless file_name.nil?
  end
  
  def value
      @calc_stack[-1]
  end
  
  def push(num)
      @calc_stack << num
  end
  
  def plus
      check_stack
      @calc_stack << @calc_stack.pop + @calc_stack.pop
  end
  
  def minus
      check_stack
      x = @calc_stack.pop
      y = @calc_stack.pop
      @calc_stack << y - x
  end
  
  def times
      check_stack
      @calc_stack << @calc_stack.pop * @calc_stack.pop
  end
  
  def divide
      check_stack
      x = @calc_stack.pop.to_f
      y = @calc_stack.pop
      @calc_stack << y / x
  end
  
  def check_stack
      raise "calculator is empty" if @calc_stack.count < 2
  end
  
  def tokens(str)
      array = str.split(" ")
      array.map! do |char|
         if /\d+/ =~ char
             char.to_i
         elsif /[\+-\/\*]/ =~ char
             char.to_sym
         end
      end
  end
  
  def evaluate(str)
      tokens(str).each do |char|
        case char
        when Fixnum
            push(char)
        when :+
            plus
        when :-
            minus
        when :*
            times
        when :/
            divide
        else
            raise("Not a valid character.")
        end
      end
      value
  end
  
  def evaluate_file(file_name)
      File.open(file_name) do |f|
         evaluate(f) 
      end
      p value
      value
  end
  
end

RPNCalculator.new
# calc = RPNCalculator.new
# p calc.evaluate("1 2 3 + - 57 2 98 * /")