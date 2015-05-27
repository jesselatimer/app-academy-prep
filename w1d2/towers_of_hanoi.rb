# Jesse Latimer, App Academy Prep, w1d2
# Because of work commitments, I did this project solo rather than in a pair.
# Features to implement: turn count

class TowersOfHanoi

  def run
    puts "Welcome to Tower of Hanoi!"
    puts "How many disks do you want to play with?"
    get_disks

    @winning_condition = (1..@disks).to_a.reverse
    @left = @winning_condition
    @middle = []
    @right = []

    start_loop
  end

  private

  def get_disks
    @disks = gets.chomp.to_i
    while @disks < 1
      puts "Invalid input. Please enter an integer greater than 0."
      @disks = gets.chomp.to_i
    end
  end

  def print_error_msg
    puts "That is not valid."
  end

  def success?
    @middle == @winning_condition || @right == @winning_condition
  end

  def state_of_game
      "\n(l)eft: #{@left.to_s}, (m)iddle: #{@middle.to_s}, (r)ight: #{@right.to_s}"
  end

  def transform_input(input)
    return @left   if ["left",   "l"].include?(input)
    return @middle if ["middle", "m"].include?(input)
    return @right  if ["right",  "r"].include?(input)
    print_error_msg
    nil
  end

  def valid_move?(from, to)
    if transform_input(from).nil? || transform_input(to).nil?
      return false
    elsif transform_input(from).empty?
      return false
    elsif transform_input(to).empty?
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
      puts "That's the best it's possible to do!"
    else
      puts "It's possible to do it in #{(2 ** @disks) - 1} moves, though. :("
    end
  end

  def get_player_input
    puts "Which stack do you want to move from?"
    move_from = gets.chomp.downcase

    puts "Which stack do you want to move to?"
    move_to = gets.chomp.downcase

    [move_from, move_to]
  end

  def start_loop
    turn_count = 0
    until success?
      puts state_of_game
      move_from, move_to = get_player_input

      if valid_move?(move_from, move_to)
        transform_input(move_to) << transform_input(move_from).pop
        turn_count += 1
      else
        print_error_msg
      end
    end

    victory(turn_count)
  end
end

TowersOfHanoi.new().run
