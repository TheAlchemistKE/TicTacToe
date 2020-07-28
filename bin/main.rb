require_relative '../lib/board'
require_relative '../lib/players'
require_relative '../lib/validate'


puts "Welcome To TicTacToe"


puts "Please enter your name:"
player1_name = gets.strip

puts "Please enter your name:"
player2_name = gets.strip


# Object Creation.
player_one = Player.new(player1_name, "X")
player_two = Player.new(player2_name, "O")
game = GameBoard.new(player_one, player_one)

turn = 1

puts game.display_board
while turn <= 9
  puts "#{game.current_player.player_name} make your move"
  player_move = gets.strip.to_i
  puts game.update_board(player_move, game.current_player.player_symbol)
end





# puts 'Wellcome to TicTacToe'

# puts 'Player1 Name'
# player1_name = gets.strip

# puts 'Player2 Name'
# player2_name = gets.strip

# def map_to_index(position)
#   position - 1
# end

# def update_board(index, board, symbol = '')
#   board[index] = symbol
#   board
# end

# def position_taken?(board, idx)
#   if board[idx] == 'X' || board[idx] == 'O'
#     true
#   else
#     false
#   end
# end

# def valid_move?(board, idx)
#   if idx.between?(0, 8) && !position_taken?(board, idx)
#     true
#   else
#     false
#   end
# end

# p1_moves = []
# p2_moves = []

# winner = nil
# # count = 1
# current_player = player1

# while winner.nil?

#   puts " #{board[0]} | #{board[1]} | #{board[2]} "
#   puts '-----------'
#   puts " #{board[3]} | #{board[4]} | #{board[5]} "
#   puts '-----------'
#   puts " #{board[6]} | #{board[7]} | #{board[8]} "

#   puts "#{current_player} Pick a number"
#   player1_position = gets.strip.to_i
#   idx = map_to_index(player1_position)

#   if valid_move?(board, idx)
#     if current_player.eql?(player1)
#       p1_moves.push(idx)
#     else
#       p2_moves.push(idx)
#     end
#     symbol = if current_player.eql?(player1)
#                'X'
#              else
#                'O'
#              end
#     board = update_board(idx, board, symbol)
#     current_player = current_player = if current_player.eql?(player1)
#                                         player2
#                                       else
#                                         player1
#                                       end
#   else
#     puts 'Invalid move'
#   end
# end
