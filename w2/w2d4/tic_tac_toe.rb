# Pair programmed by Jesse Latimer and Kata Martin
# App Academy, w2d4, 6/4/2015

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end

  def inspect
    display = {:x => "X", :o => "O", nil => " "}
    display_grid = @grid.map do |row|
      row.map { |char| display[char] }
    end
    display_grid.map! { |line| line.join(" | ") }
    display_grid.join("\n---------\n")
  end

  def empty?(pos)
    self[*pos].nil?
  end

  def on_grid?(pos)
    (0..2).include?(pos[0]) && (0..2).include?(pos[1])
  end

  def on_diagonal?(pos)
    [[0, 0], [0, 2], [1, 1], [2, 0], [2, 2]].include?(pos)
  end

  def get_diagonal_arrays(pos)
    diag1 = [[0, 0], [1, 1], [2, 2]]
    diag2 = [[0, 2], [1, 1], [2, 0]]
    diag1_vals = [self[*diag1[0]], self[*diag1[1]], self[*diag1[2]]]
    diag2_vals = [self[*diag2[0]], self[*diag2[1]], self[*diag2[2]]]
    if !on_diagonal?(pos)
      return []
    elsif pos == [1, 1]
      return [diag1_vals, diag2_vals]
    elsif diag1.include?(pos)
      return [diag1_vals]
    elsif diag2.include?(pos)
      return [diag2_vals]
    end
  end

  def transpose
    @grid[0].zip(@grid[1], @grid[2])
  end

  def place_mark(pos, mark)
    self[*pos] = mark if empty?(pos)
  end

  def won?
    # Returns true if either check returns a value.
    !check_lines(:o, 3).nil? || !check_lines(:x, 3).nil?
  end

  def winner
    if !check_lines(:x, 3).nil?
      return :x
    elsif !check_lines(:o, 3).nil?
      return :o
    else
      return nil
    end
  end

  def check_lines(mark, number)
    @grid.each_with_index do |row, i|
      row.each_with_index do |elem, j|
        # If empty and two marks in row, other two must be filled.
        if self.empty?([i, j]) || number == 3
          return [i, j] if row.count(mark) == number
          return [i, j] if transpose[j].count(mark) == number
          get_diagonal_arrays([i, j]).each do |diag|
            return [i, j] if diag.count(mark) == number
          end
        end
      end
    end
    nil
  end

end

class HumanPlayer

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_move(board)
    puts "What is your move?"
    pos = get_player_input
    until board.on_grid?(pos) && board.empty?(pos)
      puts "Invalid input. Choose an empty position on the grid."
      puts "Enter the row, then the column, as in: 'top left' or '0,0'."
      pos = get_player_input
    end
    pos
  end

  def get_player_input
    positions = {"top"    => 0, "left"   => 0,
                 "center" => 1, "middle" => 1,
                 "bottom" => 2, "right"  => 2}
    input = gets.chomp
    return [1, 1] if input == "center"
    input.split(/,| /).map do |el|
      positions.has_key?(el) ? positions[el] : el.to_i
    end
  end

end

class ComputerPlayer

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_move(board)
    puts "Computer is moving."
    return winnable(board) unless winnable(board).nil?
    random_move(board)
  end

  def random_move(board)
    while true # We know this is bad, we'll fix it.
      pos = [(0..2).to_a.sample, (0..2).to_a.sample]
      return pos if board.empty?(pos)
    end
  end

  def winnable(board)
    board.check_lines(mark, 2)
  end


end

class Game

  attr_reader :board

  def initialize
    @board = Board.new
    @players = []
    puts "The board is now on board."
  end

  def greet
    p board
    puts "X: Human or Computer?"
    @players << player_type.new(:x)
    puts "O: Human or Computer?"
    @players << player_type.new(:o)
  end

  def player_type
    while true
      type = gets.chomp.downcase
      return HumanPlayer    if type == "human"
      return ComputerPlayer if type == "computer"
      puts "Invalid input"
    end
  end

  def play
    greet
    count = 0
    until @board.won? || count > 8
      player = @players[count % 2]

      puts "#{player.mark.upcase}'s turn."
      @board.place_mark(player.get_move(@board), player.mark)
      count += 1

      puts "\nCurrent Board:"
      p @board
      puts ""
    end
    if @board.won?
      puts "#{@board.winner.upcase} wins!"
    else
      puts "Tie!"
    end

  end

end

game = Game.new
game.play
