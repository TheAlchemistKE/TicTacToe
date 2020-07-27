#!/usr/bin/env ruby
puts 'Wellcome to TicTacToe'
puts 'Player1 Name'
player1 = gets.strip

puts 'Player2 Name'
player2 = gets.strip

system('clear')

board = (1..9).to_a

def map_to_index(position)
  position - 1
end

def update_board(index, board, symbol)
  board[index] = symbol
  board
end

count = 1

while count <= 9
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

  p1_moves = []

  puts "#{player1} Pick a number"
  player1_position = gets.strip.to_i

  idx = map_to_index(player1_position)
  p1_moves << idx
  board = update_board(idx, board, 'x')

  system('clear')

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

  puts "#{player2} Pick a number"

  player2_position = gets.strip.to_i
  p2_moves = []

  idx = map_to_index(player2_position)
  p2_moves << idx
  board = update_board(idx, board, 'O')

end
# def find_winner
#   wins = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8],
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8],
#     [2, 4, 6],
#     [0, 4, 8]
#   ]
# end
