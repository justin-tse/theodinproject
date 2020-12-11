# [Lanuch School: BOOK-Object Oriented Programming with Ruby](https://launchschool.com/books/oo_ruby/read/introduction)

The book covered
- Initializing objects with the new method
- How instance variables keep track of an object's state
  @name is a instance variable
- Learning how attr_* methods generate getters and setters
(1)attr_reader :name, :name_2, ...
(2)attr_writer :name
(3)attr_accessor :name
- Using instance methods to perform operations on our objects
- Using class methods to perform operations at the class level
- Assigning class variables to relate specifically to our class
- Assigning constants that never change to perform operations in our classes
- How the to_s method is used and that we've been using it implicitly all along.
- How and when to use self

### Key Point
- Variables
  instance variables @name
  class variables @@name
- Accessor Methods in Action
(1) getter
```ruby
# Referencing the instance variable directly
def speak
  "#{@name} says arf!"
end
```

```ruby
# Use the name getter method
def speak
  "#{name} says arf!"
end
```
For example, suppose we're keeping track of social security numbers in an instance variable called @ssn. 
```ruby
def ssn
  # converts '123-45-6789' to 'xxx-xx-6789'
  'xxx-xx-' + @ssn.split('-').last
end
```
Therefore, it's generally a good idea to call the getter method instead.

(2) setter
```ruby
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
    @name = n
    @height = h
    @weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end
```
And we can use the change_info method like this:
```ruby
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
```
Just like when we replaced accessing the instance variable directly with getter methods, we'd also like to do the same with our setter methods. Let's change the implementation of the change_info method to this:
```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
```
To save space, we won't repeat the code from above, but we can see that the change_info method didn't change sparky's information:
```ruby
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.
```
What happened? Why didn't our setter methods work in the change_info method?
The reason our setter methods didn't work is because Ruby thought we were initializing local variables. 
- Calling Methods With self
  
Recall that to initialize or create new local variables, all we have to do is x = 1 or str = "hello world". It turns out that instead of calling the name=, height= and weight= setter methods, what we did was create three new local variables called name, height and weight. That's definitely not what we wanted to do.

To disambiguate from creating a local variable, we need to use self.name= to let Ruby know that we're calling a method. So our change_info code should be updated to this:
```ruby
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```
This tells Ruby that we're calling a setter method, not creating a local variable. To be consistent, we could also adopt this syntax for the getter methods as well, though it is not required.
```ruby
def info
  "#{self.name} weighs #{self.weight} and is #{self.height} tall."
end
```
Finally, if we run our code with the updated change_info method that uses the self. syntax, our code works beautifully:
```ruby
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
```
- The to_s Method

The to_s instance method comes built in to every class in Ruby. In fact, we have been using it all along. For example, suppose we have the GoodDog class from above, and the sparky object as well from above.

```ruby
puts sparky      # => #<GoodDog:0x007fe542323320>
```
What's happening here is that the puts method automatically calls to_s on its argument, which in this case is the sparky object. In other words puts sparky is equivalent to puts sparky.to_s. The reason we get this particular output lies within the to_s method in Ruby. By default, the to_s method returns the name of the object's class and an encoding of the object id.

Note: puts method calls to_s for any argument that is not an array. For an array, it writes on separate lines the result of calling to_s on each element of the array.

To test this, we can add a custom to_s method to our GoodDog class, overriding the default to_s that comes with Ruby.

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end
```
Let's try again:

```ruby
puts sparky      # => This dog's name is Sparky and is 28 in dog years.
```
And yes, it works! We were able to change the output by overriding the to_s instance method.

There's another method called p that's very similar to puts, except it doesn't call to_s on its argument; it calls another built-in Ruby instance method called inspect. The inspect method is very helpful for debugging purposes, so we don't want to override it.

```ruby
p sparky         # => #<GoodDog:0x007fe54229b358 @name="Sparky", @age=28>
```
This output implies that p sparky is equivalent to puts sparky.inspect.

Besides being called automatically when using puts, another important attribute of the to_s method is that it's also automatically called in string interpolation. We've seen this before when using integers or arrays in string interpolation:

```ruby
irb :001 > arr = [1, 2, 3]
=> [1, 2, 3]
irb :002 > x = 5
=> 5
irb :003 > "The #{arr} array doesn't include #{x}."
=> The [1, 2, 3] array doesn't include 5.
```
Here, the to_s method is automatically called on the arr array object, as well as the x integer object. We'll see if we can include our sparky object in a string interpolation:

```ruby
irb :001 > "#{sparky}"
=> "This dog's name is Sparky and it is 28 in dog years."
```
In summary, the to_s method is called automatically on the object when we use it with puts or when used with string interpolation. This fact may seem trivial at the moment, but knowing when to_s is called will help us understand how to read and write better OO code.

- More About self
  
We talked about self earlier, but let's try to dive a little deeper so you can understand exactly what self is and how to understand what it's referencing. self can refer to different things depending on where it is used.

For example, so far we've seen two clear use cases for self:

1) Use self when calling setter methods from within the class. In our earlier example we showed that self was necessary in order for our change_info method to work properly. We had to use self to allow Ruby to disambiguate between initializing a local variable and calling a setter method.

2) Use self for class method definitions.

Thus, you can see that using self inside a class but outside an instance method refers to the class itself. Therefore, a method definition prefixed with self is the same as defining the method on the class. That is, def self.a_method is equivalent to def GoodDog.a_method. That's why it's a class method; it's actually being defined on the class.

To be clear, from within a class...

3) self, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, self.weight= is the same as sparky.weight=, in our example.

4) self, outside of an instance method, references the class and can be used to define class methods. Therefore if we were to define a name class method, def self.name=(n) is the same as def GoodDog.name=(n).

- Class inheritance
```ruby
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
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

# overriding the speak method
puts sparky.speak           # => Sparky says arf!

puts paws.speak             # => Hello!
```
- super
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"
```
```ruby
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

bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```
```ruby
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear")        # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```
```ruby
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

bear = Bear.new("black")        # => #<Bear:0x007fb40b1e6718 @color="black">
```
- Mixing in Modules
  ![The entire class hierarchy](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/animal_hierarchy.jpg)
```ruby
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end

sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

sparky.swim                 # => I'm swimming!
neemo.swim                  # => I'm swimming!
paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>
```

- Inheritance vs Modules
1) You can only subclass (class inheritance) from one class. You can mix in as many modules (interface inheritance) as you'd like.
2) If there's an "is-a" relationship, class inheritance is usually the correct choice. If there's a "has-a" relationship, interface inheritance is generally a better choice. For example, a dog "is an" animal and it "has an" ability to swim.
3) You cannot instantiate modules (i.e., no object can be created from a module). Modules are used only for namespacing and grouping common methods together.

- Method Lookup Path
```ruby
puts "---Animal method lookup---"
puts Animal.ancestors

---Animal method lookup---
Animal
Walkable
Object
Kernel
BasicObject

class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "---GoodDog method lookup---"
puts GoodDog.ancestors

---GoodDog method lookup---
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject
```
There are several interesting things about the above output. First, this tells us that the order in which we include modules is important. Ruby actually looks at the last module we included first. This means that in the rare occurrence that the modules we mix in contain a method with the same name, the last module included will be consulted first. The second interesting thing is that the module included in the superclass made it on to the method lookup path. That means that all GoodDog objects will have access to not only Animal methods, but also methods defined in the Walkable module, as well as all other modules mixed in to any of its superclasses.

Sometimes when you're working on a large project, it can be confusing where all these methods are coming from. By understanding the method lookup path, we can have a better idea of where and how all available methods are organized.

- More Modules


- Private, Protected, and Public

- Accidental Method Overriding
