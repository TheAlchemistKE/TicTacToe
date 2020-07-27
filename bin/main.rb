require_relative '../lib/board'
require_relative '../lib/validate'

puts 'Wellcome to TicTacToe'

puts 'Player1 Name'
player1 = gets.strip

puts 'Player2 Name'
# player2 = gets.strip

system('clear')
board = GameBoard.new
puts board.display_board

puts "#{player1} please make your move:"
player_1_move = gets.strip.to_i

idx = map_to_index(player_1_move)

puts board.update_board(idx, 'X')
if valid_move?(board, idx)
  board.update_board
else
  puts "It doesn't work."
end
