#This main function 
def tic_tac_toe()
  size=3 #allow for potential expansion
  player1="" #starting player
  #ask for starting player
  while player1!="X" and player1!="O" do
    print "Which is the starting player?  X or O? "
    player1=gets.chomp.upcase.to_s
    if player1!="" and player1!="X" and player1!="O"
      puts "#{player1} is not a valid choice."
    end
  end
  #assign available symbol to player2
  if player1=="X"
    player2="O"
  else
    player2="X"
  end
  
  puts "The other player is #{player2}"
  #initialize board with underscore as a placeholder for blank 
  board=[["_","_","_"],["_","_","_"],["_","_","_"]]
  #board = Array.new( size, Array.new(size, "_")) <== initially initialized board like this, but caused bad behavior
  print_board(board)
  # Keep making moves until board is full or winner is established
  move=1 #count # of moves
  while move<=size**2 do # until board is full...
    #establish whose turn it is
    if move%2==1
      player=player1
      puts "#{player1}'s turn"
    else
      player=player2
      puts "#{player2}'s turn"
    end
    next_move(player,board,size)
    move+=1
    print_board(board)
    winner=over?(board,move,size)
    if winner!=nil
      break
    end
  end
  if winner==nil
    puts "It was a tie game"
  end
end

def print_board(arr)
  i=0
  while i<arr.length
    print arr[i]
    puts "\n"
    i+=1
  end
end



def over?(board,move,size)
  #initialize acceptable values for winning rows/columns/diagonals
  vals=["X","O"]
  #check for horizontal wins
  i=0
  while i<size
    count=0
    j=0
    first=board[i][j]
    if vals.include?first # Make sure only non-blanks count
      while (j<size && board[i][j]==first)
        j+=1
        count+=1
      end
    end
    if count==size
      puts "#{first} won horizontally"
      return first
      
    end
    i+=1
  end
  #check for vertical wins
   i=0
  while i<size
    count=0
    j=0
    first=board[j][i]
    if vals.include?first # Make sure only non-blanks count
      while (j<size && board[j][i]==first)
        j+=1
        count+=1
      end
    end
    if count==size
      puts "#{first} won vertically"
      return first    
    end
    i+=1
  end
  #check for diagonal  from top left to bottom right
  i=0
  count=0
  first=board[0][0]
  while i<size  
    if vals.include?first #Make sure only non-blanks count
        if board[i][i]==first
          count+=1
        else
          break
        end
    end
    i+=1
    if count==size
      puts "#{first} won diagonally"
      return first
    end
  end
#check for diagonal  from top right to bottom left
 i=0
 count=0
 first=board[0][-1]
 while i<size
    if vals.include?first #Make sure only non-blanks count
        if board[i][-i-1]==first
        count+=1
        else
          break
        end
    end
    i+=1
    if count==size
      puts "#{first} won diagonally here"
      return first
    end
  end
end

def next_move(current,board,size)
  moved=false
  while not moved
    puts "#{current}, where to do you want to move next? " 
    print "Enter your next move in the format row,column: "
    input=gets.chomp.partition(",")
    input[0]=input[0].to_i
    input[2]=input[2].to_i
    if input[0]>size or input[2]>size
      puts "Please choose column and row numbers no greater than #{size}"
    elsif input[0]<1 or input[2]<1.to_i
      puts "Rows and columns should be positive numbers"
      #when checking if space is already taken, make sure to decrease column/row by one since user will count from 1, not zero
    elsif board[input[0]-1][input[2]-1]!="_" 
      puts "That space is already taken. Please choose another"
    else
      board[input[0]-1][input[2]-1]=current
      moved=true
      #puts "board[#{input[0]-1}][#{input[2]-1}] is #{board[input[0]-1][input[2]-1]}"  <==used for troubleshooting
    end
  end
end

tic_tac_toe()


