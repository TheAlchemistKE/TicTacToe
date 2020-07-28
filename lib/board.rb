require_relative './engine.rb'
class GameBoard < GameEngine
  def initialize(player1, player2)
    super
    @board = (1..9).to_a
  end

  def display_board
    "        #{@board[0]} | #{@board[1]} | #{@board[2]}
        -----------
        #{@board[3]} | #{@board[4]} | #{@board[5]}
        -----------
        #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def switch_turn
    super
  end

  def check_for_winner
    super
  end

  def board_filled?
    false until @winner || @board.none? {|el| el.is_number?}
    true
  end

  def update_board(idx, symbol)
    @board[idx] = symbol
    check_for_winner
    display_board
    switch_turn
  end
end
