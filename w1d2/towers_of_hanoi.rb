# Jesse Latimer, App Academy Prep, w1d2
# Because of work commitments, I did this project solo rather than in a pair.
# Features to implement: turn count

class TowersOfHanoi

  def run
    puts "Welcome to Tower of Hanoi!"
    puts "How many disks do you want to play with?"

    @disks = gets.chomp.to_i
    while @disks < 1
      puts "Invalid input. Please enter an integer greater than 0."
      @disks = gets.chomp.to_i
    end

    @winning_condition = (1..@disks).to_a.reverse

    @left = @winning_condition
    @middle = []
    @right = []

    start_loop
  end

  private

  def error
    puts "That is not valid."
  end

  def success?
    @middle == @winning_condition || @right == @winning_condition
  end

  def state_of_game
      "\n(l)eft: #{@left.to_s}, (m)iddle: #{@middle.to_s}, (r)ight: #{@right.to_s}"
  end

  def transform_input(input)
    return @left if input == "left" || input == "l"
    return @middle if input == "middle" || input == "m"
    return @right if input == "right" || input == "r"
    error
    nil
  end

  def valid_move?(from, to)
    if transform_input(to).empty?
      return true
    elsif transform_input(from)[-1] < transform_input(to)[-1]
      return true
    end

    false
  end

  def victory(turn_count)
    puts state_of_game + " <- WOWOA!"
    puts "Look at that! You win!"
    puts "And in only #{turn_count} moves!"
    if turn_count == (2 ** @disks) - 1
      puts "That's the best you can do!"
    else
      puts "It's possible to do it in #{(2 ** @disks) - 1} moves, though. :("
    end
  end

  def start_loop
    turn_count = 0
    until success?
      puts state_of_game
      puts "Which stack do you want to move from?"
      move_from = gets.chomp.downcase
      next if transform_input(move_from).nil?
      if transform_input(move_from).empty?
        error
        next
      end

      puts "Which stack do you want to move to?"
      move_to = gets.chomp.downcase
      next if transform_input(move_to).nil?

      if valid_move?(move_from, move_to)
        transform_input(move_to) << transform_input(move_from).pop
        turn_count += 1
      else
        error
      end
    end

    victory(turn_count)
  end
end

TowersOfHanoi.new().run
