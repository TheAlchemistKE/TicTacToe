#!/usr/bin/env ruby
puts 'Wellcome to TicTacToe'
puts 'Player1 Name'
player1 = gets.strip

puts 'Player2 Name'
player2 = gets.strip

system('clear')

board = (1..9).to_a

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts '-----------'
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts '-----------'
puts " #{board[6]} | #{board[7]} | #{board[8]} "

puts "#{player1} Pick a number"

player1_position = gets.strip.to_i

def map_to_index(position)
  position - 1
end

def update_board(index, board, symbol)
  board[index] = symbol
  board
end

idx = map_to_index(player1_position)
board = update_board(idx, board, 'x')

system('clear')

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts '-----------'
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts '-----------'
puts " #{board[6]} | #{board[7]} | #{board[8]} "

puts "#{player2} Pick a number"

player2_position = gets.strip.to_i

idx = map_to_index(player2_position)
board = update_board(idx, board, 'O')

puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts '-----------'
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts '-----------'
puts " #{board[6]} | #{board[7]} | #{board[8]} "
