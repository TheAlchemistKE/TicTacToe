require_relative '../lib/board'
require_relative '../lib/players'
require_relative '../lib/validate'

puts 'Welcome To TicTacToe'

puts 'Please enter your name:'
player1_name = gets.strip

puts 'Please enter your name:'
player2_name = gets.strip

turn = 0
winning_player = nil

# Object Creation.
player_one = Player.new(player1_name, 'X')
player_two = Player.new(player2_name, 'O')
game = GameBoard.new

def switch_turn(turn, player1, player2, game)
  current_player = nil
  winner = nil
  if turn.even?
    current_player = player1
    puts "#{current_player.player_name} make your move."
    player_move = gets.strip.to_i
    if valid_move?(game.board, player_move) && !game.board_filled?(game.board)
      winner = game.update_board(player_move, current_player.player_symbol, current_player)
    else
      puts 'Invalid move.'
      current_player = player1
      puts "#{current_player.player_name} make your move."
      player_move = gets.strip.to_i
      winner = game.update_board(player_move, current_player.player_symbol, current_player)
    end
  else
    current_player = player2
    puts "#{current_player.player_name} make your move."
    player_move = gets.strip.to_i
    if valid_move?(game.board, player_move) && !game.board_filled?(game.board)
      winner = game.update_board(player_move, current_player.player_symbol, current_player)
    else
      puts 'Invalid Move.'
      current_player = player2
      puts "#{current_player.player_name} make your move."
      player_move = gets.strip.to_i
      winner = game.update_board(player_move, current_player.player_symbol, current_player)
    end
  end
  winner
end

puts game.display_board
while turn <= 9
  begin
    winner = switch_turn(turn, player_one, player_two, game)
  rescue NoMethodError
    puts "It's a draw guys."
    break
  end

  puts game.display_board

  if winner
    winning_player = winner
    break
  end
  game.display_board

  turn += 1
end

puts "#{winning_player.player_name} is the winner."
