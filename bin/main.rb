require_relative '../lib/board'
require_relative '../lib/players'
require_relative '../lib/validate'

puts 'Wellcome to TicTacToe'

puts 'Player1 Name'
player1_name = gets.strip

puts 'Player2 Name'
player2_name = gets.strip

def map_to_index(position)
  position - 1
end

def update_board(index, board, symbol = '')
  board[index] = symbol
  board
end

def position_taken?(board, idx)
  if board[idx] == 'X' || board[idx] == 'O'
    true
  else
    false
  end
end

def valid_move?(board, idx)
  if idx.between?(0, 8) && !position_taken?(board, idx)
    true
  else
    false
  end
end

wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], #Horizontal Winnings
    [0, 3, 6], [1, 4, 7], [2, 5, 8], #Vertical Winnings
    [2, 4, 6], [0, 4, 8]]

p wins

board = (1..9).to_a
p1_moves = []
p2_moves = []

winner = nil
count = 1
current_player = player1_name

while winner.nil?

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

  puts "#{current_player} Pick a number"
  player1_position = gets.strip.to_i
  idx = map_to_index(player1_position)

  if valid_move?(board, idx)
    if current_player.eql?(player1_name)
      p1_moves.push(idx)
    else
      p2_moves.push(idx)
    end
    symbol = if current_player.eql?(player1_name)
               'X'
             else
               'O'
             end
    board = update_board(idx, board, symbol)
    current_player = current_player = if current_player.eql?(player1_name)
                                        player2_name
                                      else
                                        player1_name
                                      end
    count += 1
    if count > 5
      if wins.any? { |win| win.all? { |item| board[item] == "X"}}
        winner = player1_name
        puts "the winner is #{player1_name}"
      elsif wins.any? { |win| win.all? { |item| board[item] == "O"}}
        winner = player2_name
        puts "the winner is #{player2_name}"
      end  
    elsif count > 9
        puts "Its a draw"
        break
    end                                     
    puts  "those are  #{p1_moves} and the turn #{count}" 
    puts  "those are #{p2_moves} and the turn #{count}"                                
  else
    puts 'Invalid move'
  end
end
