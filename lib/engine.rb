class GameEngine
  attr_reader :winner
  def initialize
    @wins = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal Winnings
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Vertical Winnings
      [2, 4, 6], [0, 4, 8] # Diagonal winnings.
    ]
    @winner = nil
  end

  def check_for_winner(player)
    @wins.each do |moves|
      @winner = player if moves.all? { |idx| @board[idx] == player.player_symbol }
    end
    @winner
  end
end
