# No bonus exercises implemented

class Board

  attr_reader :grid

  def initialize(size = 5)
    @grid = Array.new(size) { Array.new(size) }
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end

  def populate_grid(ships = 5)
    positions = []
    until positions.count == ships
      position = [rand(@grid.count), rand(@grid.count)]
      self[*position] = :ship unless positions.include?([*position])
      positions << position unless positions.include?([*position])
    end
  end

  def count_ships
    @grid.inject(0) { |accum, row| accum += row.count(:ship) }
  end

  def display
    display = { :hit => "H", :miss => "M", :ship => "S", nil => "~" }
    display_grid = @grid.map do |row|
      row.map { |char| display[char] }
    end
    display_grid.map! { |line| line.join(" | ") }
    display_grid.join("\n#{"----" * (@grid.count - 1)}--\n")
  end

  def in_range?(pos)
    pos.all? { |x| (0...@grid.count).to_a.include?(x) }
  end

end

class BattleshipGame

  attr_reader :board

  def initialize(size)
    @board = Board.new(size)
  end

  def play(ships)
    @board.populate_grid(ships)
    @player = HumanPlayer.new(@board.grid.count)
    until @board.count_ships == 0
      play_turn
    end
    victory
  end

  def play_turn
    display_status
    pos = @player.get_input
    unless board.in_range?(pos)
      not_in_range
      return
    end
    attack(pos)
  end

  def attack(pos)
    already_attacked if board[*pos] == :hit || board[*pos] == :miss
    hit(pos) if board[*pos] == :ship
    miss(pos) if board[*pos] == nil
  end

  def display_status
    puts "\nCurrent board:"
    puts "#{@board.display}\n"
    puts "\nRemaining ships: #{@board.count_ships}"
  end

  def hit(pos)
    board[*pos] = :hit
    puts "\nYou hit an enemy ship. Kaboom!\n"
  end

  def miss(pos)
    board[*pos] = :miss
    puts "\nYou hit only water. Miss!\n"
  end

  def already_attacked
    puts "\nYou've already attacked that position!\n"
  end

  def not_in_range
    puts "\nNot a valid entry!\n"
  end

  def victory
    puts "\nYou have won!!!!!!!!\n\n"
  end

end

class HumanPlayer

  def initialize(size)
    @size = size
  end

  def get_input
    puts "\nWhat position on the y axis? (Between 0 and #{@size - 1}.)"
    x = gets.to_i
    puts "\nWhat position on the x axis? (Between 0 and #{@size - 1}.)"
    y = gets.to_i
    [x, y]
  end
end

puts "What size board?"
game = BattleshipGame.new(gets.to_i)
puts "How many ships?"
game.play(gets.to_i)
