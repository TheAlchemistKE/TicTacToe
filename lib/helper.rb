def position_taken?(board, idx)
  if board[idx] == 'X' || board[idx] == 'O'
    true
  else
    false
  end
end

def valid_move?(board, position)
  idx = position - 1
  if idx.between?(0, 8) && !position_taken?(board, idx)
    true
  else
    false
  end
end

def prompt_input(current_player)
  puts "#{current_player.player_name} make your move."
  player_move = gets.strip.to_i
  player_move
end

def invalid_move_prompt(current_player)
  puts 'Invalid Move.'
  winner = $game.update_board(prompt_input(current_player), current_player.player_symbol, current_player)
  winner
end
