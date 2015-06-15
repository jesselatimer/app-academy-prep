# By Tad Schukar and Jesse Latimer, App Academy, w3d2

class Game
  attr_reader :master_code

  def initialize
    @master_code = Code.new
    @master_code.random
    @turns = 0
  end

  def play
    p @master_code.code #erase this line
    until @turns > 9
      input = get_player_input
      exact_count = @master_code.exact_matches(input.code)
      break if exact_count == 4
      near_count = @master_code.near_matches(input.code)
      puts "Exact matches: #{exact_count}, near matches: #{near_count}"
      @turns += 1
    end
    @turns > 9 ? lost : victory
  end

  def get_player_input
      puts "Turn #{@turns + 1}"
      puts "What is your guess? (RBGYOP)"
      input = Code.new
      loop do
        player_input = gets.chomp
        if input.valid_code?(player_input)
          input.parse(player_input)
          break
        end
      end
      input
  end

  def victory
    puts "You won! The correct code was #{@master_code.code}."
  end

  def lost
    puts "You lost! The correct code was #{@master_code.code}."
  end

end

class Code
  attr_reader :code

  def initialize
    @PEGS = ["B", "G", "Y", "R", "O", "P"]
    @code = []
  end

  def random
    4.times { @code << @PEGS[rand(6)] }
  end

  def parse(input)
    @code = input.upcase.split("")
  end

  def valid_code?(input)
    input.upcase.split("").all? { |x| @PEGS.include?(x) } && input.length == 4
  end

  def exact_matches(pegs)
    count = 0
    pegs.each_with_index do |peg, i|
      count += 1 if @code[i] == peg
    end
    count
  end

  def near_matches(pegs)
    count = 0
    correct_pegs = @code.dup
    pegs.each do |peg|
      if correct_pegs.include?(peg)
        count += 1
        correct_pegs.delete_at(correct_pegs.index(peg))
      end
    end
    count - exact_matches(pegs)
  end

end

game = Game.new
game.play
