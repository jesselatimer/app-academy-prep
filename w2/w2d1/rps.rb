MOVES = %w(rock paper scissors)

WIN_CONDITIONS = {
  ["rock", "paper"] => "lose",
  ["rock", "scissors"] => "win",
  ["rock", "rock"] => "tie",
  ["paper", "rock"] => "win",
  ["paper", "scissors"] => "lose",
  ["paper", "paper"] => "tie",
  ["scissors", "rock"] => "lose",
  ["scissors", "paper"] => "win",
  ["scissors", "scissors"] => "tie"
}

def rps
  puts "Rock Paper Scissors. What's your move?"
  player_move = gets.chomp.downcase
  return "Not a valid move." unless MOVES.include?(player_move)
  computer_move = MOVES.sample
  result = WIN_CONDITIONS[[player_move, computer_move]]
  "Computer plays #{computer_move}, you #{result}."
end

puts rps
