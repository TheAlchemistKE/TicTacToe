def position_taken?(board, idx)
    if(board[idx] == 'X' || board[idx] == "O")
        return true
    else
        return false
    end
end

def valid_move?(board, idx)
    if idx.between?(0..8) && !position_taken?(board, idx)
        return true
    else
        return false
    end
end