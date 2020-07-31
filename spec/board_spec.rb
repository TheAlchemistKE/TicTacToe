require 'rspec'
require_relative '../lib/board'

describe GameBoard do
  describe '#display_board' do
    it 'Displays the TicTacToe board to the players.' do
      expect(subject.display_board).to eql(
        "        1 | 2 | 3
        -----------
        4 | 5 | 6
        -----------
        7 | 8 | 9 "
      )
    end
  end
end
