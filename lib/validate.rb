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

def map_to_index(position)
  position - 1
end
