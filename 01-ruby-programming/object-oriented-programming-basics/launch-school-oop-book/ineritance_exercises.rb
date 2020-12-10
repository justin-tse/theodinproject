module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end
class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_reader :year, :model

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles."
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
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
  include Towable
  NUMBER_OF_DOORS = 2
  def to_s 
    "My truck is a #{color}, #{year}, #{model}."
  end
end

my_car = MyCar.new("2020", "Ford Focus", "silver")
my_truck = MyTruck.new("2020", "Ford Tundra", "white")

puts my_car
puts my_truck
puts Vehicle.number_of_vehicles

puts my_truck.can_tow?(3000)
puts my_truck.can_tow?(1000)

puts "-" * 18
puts MyCar.ancestors
puts "-" * 18
puts MyTruck.ancestors
puts "-" * 18
puts Vehicle.ancestors