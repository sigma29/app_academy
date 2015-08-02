class Pet
  def initialize(name)
   @name=name
  end
  attr_accessor :age, :name
end

class Puppy < Pet
  @@dog_years=7
  def initialize(name)
    @@number_of_pups = defined?(@@number_of_pups) ? @@number_of_pups+1: 1
    super
  end

  def speak
    puts "Arf!"
  end
  def dog_age
    @age*@@dog_years
  end
  def self.count
    puts @@number_of_pups
  end
end

class Beagle < Puppy
  def speak
    puts "Arrrrowow"
  end
end

a=Beagle.new("Saphy")
a.age=13
puts a.name
a.speak
puts a.dog_age
