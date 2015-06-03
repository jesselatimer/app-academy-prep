# Written by Jesse Latimer and Darren Tan for App Academy Prep

class RPNCalculator
  
  def initialize
      @calc_stack = []
      if !ARGV.empty? && __FILE__ == $PROGRAM_NAME
          file_name = ARGV[0]
          evaluate_file(file_name)
      else
          evaluate_input
      end
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
        evaluate_character(char)
      end
      value
  end
  
  def evaluate_character(char)
        case char
        when Fixnum then push(char)
        when :+ then plus
        when :- then minus
        when :* then times
        when :/ then divide
        else
            raise("Not a valid character.")
        end
  end
  
  def evaluate_file(file_name)
      File.foreach(file_name) do |line|
         evaluate(line.strip) 
      end
  end
  
  def evaluate_input
      input_string = ""
      puts "Enter stuff."
      char = gets.chomp
      until char.empty? do
          input_string << " #{char}"
          char = gets.chomp
      end
      evaluate(input_string.strip)
  end
end

x = RPNCalculator.new
p x.value