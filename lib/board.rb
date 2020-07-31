require_relative './engine.rb'
class GameBoard < GameEngine
  attr_reader :board
  def initialize
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

  def check_for_winner(player)
    super
  end

  def board_filled?(board)
    moves = board.any? { |el| el.is_a?(Integer) }
    moves = if moves
              false
            else
              true
            end
    moves
  end

  def update_board(position, symbol, player)
    @board[position - 1] = symbol
    winner = check_for_winner(player)
    winner
  end
end
