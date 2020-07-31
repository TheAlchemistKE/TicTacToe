#!/usr/bin/env ruby
require_relative '../lib/board'
require_relative '../lib/players'
require_relative '../lib/helper'
require 'colorize'
require 'tty-font'
require 'tty-prompt'

font = TTY::Font.new(:standard)
puts font.write("TicTacToe")

puts 'Welcome To TicTacToe'.upcase.colorize(:cyan)
puts
puts 'To play the game, follow instructions below.'
puts '---------------------------------------'
puts '|------------INSTRUCTIONS----------------|'
puts '1. Both players should enter their names.'
puts '2. A TicToe board will presented to you with numbers 1 through 9.'
puts "3. Enter numbers 1 through 9 that corresponds to the position on the board that you'd like to occupy."
puts
puts 'May the force be with you.'.upcase.colorize(:magenta)
puts

prompt = TTY::Prompt.new

player1_name = prompt.ask("Player 1, What's your name?")
player2_name = prompt.ask("Player 2, What's your name?")

system("clear")

turn = 0

# Object Creation.
player_one = Player.new(player1_name, 'X')
player_two = Player.new(player2_name, 'O')
game = GameBoard.new

def prompt_input(current_player)
  puts "#{current_player.player_name} make your move.".colorize(:green)
  player_move = gets.strip.to_i
  player_move
end

def check_winner_update_board(_board, player_move, current_player, game)
  if valid_move?(game.board, player_move)
    game.update_board(player_move, current_player.player_symbol, current_player)
  else
    puts 'Invalid Move.'.colorize(:red)
    invalid_move_prompt(current_player, game)
  end
end

def switch_turn(turn, player1, player2, game)
  winner = if turn.even?
             check_winner_update_board(game.board, prompt_input(player1), player1, game)
           else
             check_winner_update_board(game.board, prompt_input(player2), player2, game)
           end
  winner
end

puts game.display_board
while turn <= 8
  winner = switch_turn(turn, player_one, player_two, game)
  system('clear')
  puts game.display_board

  if winner
    puts "#{winner.player_name} is the winner."
    break
  elsif game.board_filled?(game.board)
    puts "It's a draw guys."
    break
  end
  turn += 1
end
