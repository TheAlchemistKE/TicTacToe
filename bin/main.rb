require_relative '../lib/board'
require_relative '../lib/players'
require_relative '../lib/validate'

puts 'Wellcome to TicTacToe'

puts 'Player1 Name'
player1_name = gets.strip

puts 'Player2 Name'
player2_name = gets.strip

player1 = Player.new(player1_name, 'X')
player2 = Player.new(player2_name, 'O')
board = GameBoard.new(player1, player2)

system('clear')



while board.board_filled?
  puts board.display_board
  puts "#{board.current_player.name} is your turn to play."
  
end


# system('clear')
# board = GameBoard.new
# puts board.display_board

# puts "#{player1} please make your move:"
# player_1_move = gets.strip.to_i

# idx = map_to_index(player_1_move)

# puts board.update_board(idx, 'X')
# if valid_move?(board, idx)
#   board.update_board
# else
#   puts "It doesn't work."
# end
