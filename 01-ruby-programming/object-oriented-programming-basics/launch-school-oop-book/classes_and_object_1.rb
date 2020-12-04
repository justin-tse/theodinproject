class GoodDog
  # attr_reader :name
  # attr_writer :name
  attr_accessor :name

  def initialize(name)
    puts "This object was initialized!"
    @name = name
  end

  # def name
  #   @name
  # end

  # def name=(name)
  #   @name = name
  # end



  def speak
    "#{@name} says Arf!"
  end

  # def name (new_name)
  #   @name = new_name
  # end

end

# sparky = GoodDog.new("Sparky")
# p sparky.speak

# fido = GoodDog.new("Fido")
# p fido.speak

# puts fido.name

# puts fido.name = "Spartacus"


class GoodDog
  attr_accessor :name, :height, :weight

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

class MyCar

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
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

class MyCar
  attr_accessor :color
  attr_reader :year
  # ... rest of class left out for brevity
end

lumina.color = 'black'
puts lumina.color
puts lumina.year

class MyCar
  attr_accessor :color
  attr_reader :year

  # ... rest of class left out for brevity

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

lumina.spray_paint('red')   #=> "Your new red paint job looks great!"