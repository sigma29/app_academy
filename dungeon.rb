class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player=Player.new(player_name)
    @rooms=[]
    @items=[]
    @carried_items =[]
  end

  def add_room(reference, name, description, connections)
    @rooms <<Room.new(reference, name, description, connections)
  end

  def add_item(reference, name, description, location, can_illuminate)
    @items <<Item.new(reference, name, description, location, can_illuminate)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def is_illuminated?
     ((@items.detect {|item| item.location==(@player.location) && item.can_illuminate?==true}) !=nil) || (@player.location==:crystal_cavern)
  end

  def show_current_description
    if is_illuminated?
      puts find_room_in_dungeon(@player.location).full_description
    else
      puts find_room_in_dungeon(@player.location).dark_description
    end
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference ==reference }
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def search_room
    @items.each do |item|
      if item.location==(@player.location) && (!@carried_items.include?(item))
       print "You found "
       item.full_description
       puts ""
      end
    end
  end

  def go
    directions=%w{north east south west}
    choice=""
    while !directions.include?(choice) do
      print "In which cardinal direction would you like to go? "
      choice=gets.chomp.downcase
      puts "Please enter a valid cardinal direction" if !directions.include?(choice)
    end
    choice=choice.to_sym
    original_location=@player.location
    @player.location =find_room_in_direction(choice)
    if @player.location==nil
      puts "You try to go " + choice.to_s + ", but your way is blocked by the walls of the cavern.\n\n"
      @player.location=original_location
    end
    @carried_items.each do |item|
      item.location=@player.location
    end
    show_current_description
  end

  def pick_up(reference)
    reference=reference.to_sym
    @items.each do |item|
      if item.location==(@player.location) && item.reference==reference &&(!@carried_items.include?(item))
        @carried_items << item
        print "You picked up "
        item.full_description
        puts ""
      end
    end
  end

  def drop(reference)
    reference=reference.to_sym
    @carried_items.each do |item|
      if item.reference==reference
        @carried_items.delete(item)
        print "You dropped "
        item.full_description
        puts ""
      end
    end
  end

  def carrying?
    @carried_items.each do |item|
      print "You have "
      item.full_description
      puts ""
    end
  end

  class Player
    attr_accessor :name, :location

    def initialize(player_name)
      @name= player_name
    end

  end

  class Room
    @@dark="a pitch-black space"
    attr_accessor :reference,:name,:description,:connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name= name
      @description = description
      @connections = connections
    end

    def full_description
      print @name +"\n\nYou are in "+ @description
    end

    def dark_description
        print @name +"\n\nYou are in "+ @@dark
    end
  end

  class Item
    attr_accessor :reference,:name,:description,:location,:can_illuminate?,:lifetime

    def initialize(reference,name,description,location,can_illuminate?)
      @reference=reference
      @name=name
      @description=description
      @location=location
      @can_illuminate=can_illuminate?
    end

    def full_description
      print @name +  ", " +  @description + " (" + @reference.to_s + ")"
    end
  end
end




# Create main dungeon object
my_dungeon = Dungeon.new("Vin")

# Add rooms to the dungeon
my_dungeon.add_item(:torch1,"Torch","a bright-burning torch",:passage,true)
my_dungeon.add_item(:torch2,"Torch","a bright-burning torch",:gated_passage,true)
my_dungeon.add_item(:candle1,"Candle Stub","a stub of a beeswax candle",:rockfall,true)
my_dungeon.add_item(:coin1,"Copper Coin","a coin blue with age",:passage,false)
my_dungeon.add_item(:sword,"Sword","a hefty broadsword, somewhat tarnished with age",:guardroom, false)
my_dungeon.add_room(:storeroom,"Store Room", "a large cavern stocked high with provisions", {
  :east => :crystal_cavern, :south => :guardroom})
my_dungeon.add_room(:inquisitors_chamber,"Inquisitor's Chamber", "a small room with rusty torture implements",{
  :east => :cell1, :west => :cell2, :north =>:gated_passage})
my_dungeon.add_room(:crystal_cavern,"Crystal Cavern","a large cavern suffused with the dim light of glowing blue crystals",{
  :west => :storeroom})
my_dungeon.add_room(:guardroom, "Guard Room", "a small chamber with table and chairs, the cards from a hastily abandoned game scattered",{
  :north => :storeroom, :south => :passage})
my_dungeon.add_room(:passage,"Passageway", "a wide tunnel with rusted sconces regularly spaced on the sides",{
  :north => :guardroom, :west =>:rockfall, :south => :gated_passage})
my_dungeon.add_room(:rockfall,"Rockfall Chamber","a chamber with all but a few feet by the door blocked by debris from a cave-in",{
  :east => :passage})
my_dungeon.add_room(:gated_passage,"Gated Passage","a narrow passage with an ajar iron gate at the southern end, keys still in the lock",{
  :south => :inquisitors_chamber, :north => :passage})
my_dungeon.add_room(:cell1,"Prisoner's Cell", "a cramped cell with a dessicated corpse huddled in the corner",{
  :west => :inquisitors_chamber})
my_dungeon.add_room(:cell2, "Empty Cell", "a dank cramped cell",{
:east => :inquisitors_chamber})
#Start your adventure
my_dungeon.start(:passage)
my_dungeon.search_room
my_dungeon.pick_up("torch1")
my_dungeon.carrying?
