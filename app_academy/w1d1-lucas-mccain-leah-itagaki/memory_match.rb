require 'byebug'

class Card
  attr_accessor :face_value, :face_up

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
    self
  end

  def ==(other_card)
    self.face_value == other_card.face_value
  end

end

class Board
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def make_pair(value)
    2.times {@cards << Card.new(value)}
  end

  def populate(pairs)
    0.upto(pairs-1) do |number|
      make_pair(number)
    end
    @cards.shuffle!
  end

  def render(row_length)
    string = ""
    @cards.each_with_index do |card,index|
      if card.face_up
        string << "#{card.face_value}\t"
      else
        string << "(#{card.face_value})\t"
      end
      string << "\n" if (index+1)%row_length == 0
    end

    puts string
  end

  def won?
    won = @cards.all? {|card| card.face_up}
    puts "You are awesome!" if won
    won
  end

end

class Game
  attr_accessor :board, :previous_guess, :pairs, :row_length, :player, :turns

  MAX_TURNS = 3

  def initialize(pairs = 5, row_length = 3)
    @board = Board.new
    @pairs = pairs
    @previous_guess = nil
    @row_length = row_length
    @player = nil
    @turn = 0
  end

  def decide_player
    options = ["Y","N"]
    puts "Would you like to be a computer? (Y/N)"
    input = ""
    until options.include?(input)
      input = gets.chomp.upcase
      puts "Please enter Y or N" unless options.include?(input)
    end
    input == "Y" ? ComputerPlayer.new : HumanPlayer.new
  end

  def setup
    @player = decide_player
    @board.populate(@pairs)
    @board.render(@row_length)
    player.populate_available_cards(@pairs * 2)
    @turns = 1
  end

  def play
    setup
    until @board.won? || lost?
      puts "Turn #{@turns}"
      guess1 = get_guess
      card1 = get_card(guess1).reveal
      player.receive_revealed_card(guess1,card1.face_value)
      @board.render(@row_length)
      guess2 = get_guess
      card2 = get_card(guess2).reveal
      player.receive_revealed_card(guess2,card2.face_value)
      @board.render(@row_length)
      if card1 != card2
        card1.hide
        card2.hide
      else
        player.available_cards.delete(guess1)
        player.available_cards.delete(guess2)
      end
      turn_end
    end
  end

  def turn_end
    if @player.class == HumanPlayer
      sleep(3)
      system("clear")
    end
    @board.render(@row_length)
    @previous_guess = nil
    @turns += 1
  end

  def lost?
    puts "Womp womp wommmmmmp" if @turns == MAX_TURNS
    @turns == MAX_TURNS
  end

  def get_guess
    guess = @player.get_pos(self)
    until valid_guess?(guess)
      puts "Please enter a number between 0 and #{board.cards.size-1}"
      guess = @player.get_pos(self)
    end
    guess
  end

  def get_card(guess)
    @previous_guess = guess
    @board.cards[guess]
  end

  def valid_guess?(guess)
    max = board.cards.size
    (0...max).include?(guess)
  end


end

class HumanPlayer
  attr_accessor :available_cards

  def initialize
    @available_cards = []
  end

  def get_pos(blank)
    puts "Choose a position to reveal: "
    Integer(gets.chomp)
  end

  def populate_available_cards(size)
  end

  def receive_revealed_card(guessed_pos,value)
  end

end

class ComputerPlayer
  attr_accessor :known_cards, :guessed_positions,:available_cards

  def initialize
    @known_cards = {}
    @available_cards = []
    @guessed_positions = []
  end

  def populate_available_cards(size)
    0.upto(size-1) {|num| @available_cards << num}
  end


  def receive_revealed_card(guessed_pos,value)
    @known_cards[guessed_pos] = value
  end

  def get_pos(game)
    if game.previous_guess.nil?
      if doubles.empty?
        guess = random_guess
      else
        guess = doubles[0]
      end
    else
      if doubles.empty?
        guess = random_guess
      else
        guess = doubles[1]
      end
    end
    @guessed_positions << guess
    guess
  end

  private

  def doubles
    doubles = []
    @known_cards.each do |key1,value1|
      @known_cards.each do |key2,value2|
        available = @available_cards.include?(key1)
        doubles = doubles + [key1,key2] if value1 == value2 && key1 != key2 && available
      end
    end
    doubles
  end

  def random_guess
    @available_cards.sample
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
