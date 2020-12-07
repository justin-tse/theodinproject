class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name
   
  def initialize(n)
    self.name = n
  end
  
  def speak
    super + " from GoodDog class"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new
puts sparky.speak
puts paws.speak


class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

p BadDog.new(2, "bear")

class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super()
    @color = color
  end
end
 
bear = Bear.new("black")
p bear

module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end 

sparky = Dog.new
neemo = Fish.new
paws = Cat.new

p sparky.swim
p neemo.swim
paws.swim
