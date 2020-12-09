# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   attr_accessor :name
   
#   def initialize(n)
#     self.name = n
#   end
  
#   def speak
#     super + " from GoodDog class"
#   end
# end

# class Cat < Animal
# end

# sparky = GoodDog.new("Sparky")
# paws = Cat.new
# puts sparky.speak
# puts paws.speak


# class Animal
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# class GoodDog < Animal
#   def initialize(color)
#     super
#     @color = color
#   end
# end

# bruno = GoodDog.new("brown")
# p bruno

# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# p BadDog.new(2, "bear")

# class Animal
#   def initialize
#   end
# end

# class Bear < Animal
#   def initialize(color)
#     super()
#     @color = color
#   end
# end
 
# bear = Bear.new("black")
# p bear

# module Swimmable
#   def swim
#     "I'm swimming!"
#   end
# end

# class Animal; end

# class Fish < Animal
#   include Swimmable
# end

# class Mammal < Animal
# end

# class Cat < Mammal
# end

# class Dog < Mammal
#   include Swimmable
# end 

# sparky = Dog.new
# neemo = Fish.new
# paws = Cat.new

# p sparky.swim
# p neemo.swim
# # paws.swim

# module Walkable
#   def walk
#     "I'm walking."
#   end
# end

# module Swimmable
#   def swim
#     "I'm swimming"
#   end
# end

# module Climable
#   def climb
#     "I'm climbing."
#   end
# end

# class Animal
#   include Walkable

#   def speak
#     "I'm an animal, and I speak!"
#   end
# end

# puts "---Animal method lookup---"
# puts Animal.ancestors

# fido = Animal.new
# p fido.speak

# p fido.walk

# class GoodDog < Animal
#   include Swimmable
#   include Climable
# end

# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors

module Mammal

  def self.some_out_of_place_method(num)
    num ** 2
  end
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak("Arf!")
kitty.say_name("kitty")


p value = Mammal::some_out_of_place_method(4)

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  private

  def human_years
    age * DOG_YEARS
  end
  
end

sparky = GoodDog.new("Sparky", 4)
p sparky.public_disclosure


class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm protected!"
  end
end

fido = Animal.new
p fido.a_public_method        # => Will this work? Yes, I'm protected!

# fido.a_protected_method

class Parent
  def say_hi
    p "Hi from Parent."
  end
end

p Parent.superclass

class Child < Parent
  def say_hi
    p "Hi from Child."
  end
end

child = Child.new
child.say_hi

son = Child.new
son.send :say_hi

class Child
  def say_hi
    p "Hi from Child."
  end

  def send
    p "send from Child..."
  end
end

lad = Child.new
# lad.send :say_hi
c = Child.new
p c.instance_of? Child
p c.instance_of? Parent

class Child
  def instance_of?
    p "I am a fake instance"
  end
end

heir = Child.new
heir.instance_of? Child

