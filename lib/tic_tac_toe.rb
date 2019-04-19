WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [6,4,2], #diagonal foward slash
  [0,4,8], #diagonal back slash
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1 
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  

  until valid_move?(board, index)
    turn(board)
  end
  
  char = current_player(board)
  move(board, index, char)
  display_board(board)
end

def turn_count(board)
  board.reject{|char| char == " "  || char == nil}.length
end

def current_player(board)
  if turn_count(board) % 2 == 0
    'X'
  else
    'O'
  end
end