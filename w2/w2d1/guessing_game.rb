# Write a number guessing game. The computer should choose a number between 1
# and 100. It should prompt the user for guesses. Each time, it will prompt the
# user for a guess; it will return too high or too low. It should track the
# number of guesses the player took.

class NumberGuessingGame
  def initialize
    @num = (1..100).to_a.sample
    @count = 0
    @guess = 0
  end

  def play
    until @guess == @num
      puts get_player_guess
    end
    puts victory
  end

  private
  def get_player_guess
    puts "Guess a number between 1 and 100."
    @guess = gets.chomp.to_i
    return "Invalid" unless @guess.between?(1, 100)
    @count += 1
    compare
  end

  def compare
    if @guess < @num
      "Too low!"
    elsif @guess >@num
      "Too high!"
    end
  end

  def victory
    "Yes! You guessed it in only #{@count} turns, it was #{@num}!"
  end
end

NumberGuessingGame.new.play
