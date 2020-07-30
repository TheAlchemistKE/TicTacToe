require_relative '../lib/board'
require_relative '../lib/players'

puts 'Wellcome to TicTacToe'
puts 'Player1 enter your name'
player1_name = Player.new(gets.strip, 'X')
puts 'Player2 enter your name'
player2_name = Player.new(gets.strip, 'O')
board = GameBoard.new((1..9).to_a)
winner = nil
current_player = player2_name
while winner.nil?
  current_player = current_player = if current_player.eql?(player2_name)
                                      player1_name
                                    else
                                      player2_name
                                    end
  puts board.display_board
  puts "#{current_player.player_name} Pick a number"
  idx = gets.strip.to_i - 1
  if board.valid_move?(idx)
    symbol = current_player.player_symbol
    board.update_board(idx, symbol)
    if board.winner?(winner) == 1
      winner = player1_name
      puts "the winner is #{player1_name.player_name}"
    elsif board.winner?(winner) == 2
      winner = player2_name
      puts "the winner is #{player2_name.player_name}"
    end
  elsif board.board.all?.is_a?(String)
    puts 'Its a draw'
    break
  else
    puts 'Invalid move'
  end
end
puts board.display_board
