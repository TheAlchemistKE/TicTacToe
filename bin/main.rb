# require_relative '../lib/board'
# require_relative '../lib/players'
# require_relative '../lib/validate'

puts 'Wellcome to TicTacToe'

puts 'Player1 Name'
player1_name = gets.strip

puts 'Player2 Name'
player2_name = gets.strip

def map_to_index(position)
  position - 1
end

def update_board(index, board, symbol = '')
  board[index] = symbol
  board
end

def position_taken?(board, idx)
  if board[idx] == 'X' || board[idx] == 'O'
    true
  else
    false
  end
end

def valid_move?(board, idx)
  if idx.between?(0, 8) && !position_taken?(board, idx)
    true
  else
    false
  end
end

def winner?(arr)
  wins = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal Winnings
    [0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical Winnings
    [2, 4, 6], [0, 4, 8] #Diagonal winnings.
  ]
  state = nil
  wins.each do |move_combo|
    if move_combo == arr
      state = true
    else
      state = false
    end
  end
  state
end
p1_moves = [0, 1, 2]
p2_moves = []

if winner?(p1_moves)
  puts "Congratulations #{player1_name}, you won."
  puts "Sorry #{player2_name}, better luck next time."
elsif winner?(p2_moves)
  puts "Congratulations #{player2_name}, you won."
  puts "Sorry #{player1_name}, better luck next time."
end



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
