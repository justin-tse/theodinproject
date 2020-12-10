class Vehicle
  attr_accessor :color
  attr_reader :year, :model

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

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
end
class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def to_s 
    "My car is a #{color}, #{year}, #{model}."
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  def to_s 
    "My truck is a #{color}, #{year}, #{model}."
  end
end

my_car = MyCar.new("2020", "Ford Focus", "silver")
my_truck = MyTruck.new("2020", "Ford Tundra", "white")

puts my_car
puts my_truck