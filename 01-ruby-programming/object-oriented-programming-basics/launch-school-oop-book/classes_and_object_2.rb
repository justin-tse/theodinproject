class GoodDog
  attr_accessor :name, :height, :weight

  def self.what_am_i
    "I'm a GoodDog class!"
  end

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weights #{weight} and is #{height} tall."
  end
end

# sparky = GoodDog.new('Spark', '12 inches', '10 lbs')
# puts sparky.info

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.name
# puts sparky.info
# p GoodDog.what_am_i

class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

# puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

# puts GoodDog.total_number_of_dogs

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age
  def initialize(n, a)
    @name = n
    @age = a * DOG_YEARS
  end

  def to_s
    puts "This dog's name is #{name} and it is #{age} in dog years."
  end
end
# sparky = GoodDog.new("Sparky", 4)
# puts sparky
# puts "#{sparky}"

class GoodDog
  self
end

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    puts "My #{self.color} car #{@model} is brought in #{self.year}."
  end
end
MyCar.gas_mileage(10, 33)
my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car
