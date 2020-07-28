class GameEngine
    attr_reader :current_player
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @current_player = player1
        @wins = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal Winnings
            [0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical Winnings
            [2, 4, 6], [0, 4, 8] #Diagonal winnings.
        ]
        @winner = nil
    end
    def switch_turn
        @current_player = @current_player == player1 ? player2 : player1
    end

    def check_for_winner(arr)
        @wins.each do |moves|
            if moves.eql?(arr)
                true
            else
                false
            # @winner = @current_player if moves.all? {|idx| @board[idx] == @current_player.symbol}
        end
    end 
end
