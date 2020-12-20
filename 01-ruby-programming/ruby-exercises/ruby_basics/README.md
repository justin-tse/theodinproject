# Ruby Basics Exercises
These exercises are designed to compliment the [Ruby Basic lessons](https://www.theodinproject.com/courses/ruby-programming#basic-ruby) on [The Odin Project](https://www.theodinproject.com/). Each Folder contain exercises and specs(tests) for the lessons in the Ruby Basics section.
###  Contents
#### Some unfamiliar 
#### 1.Basic Data Types
- [x] Numbers Exercises 
- [x] Strings Exercises 
```ruby
def concatenate(string)
  # use concatenation to format the result to be "Hello <string>!"
  "Hello ".concat(string) + '!'
end

def space_remover(string)
  # remove all the spaces in the string using gsub
  string.gsub(' ', '')
end
```
#### 6.Arrays
- [x] Array Exercises 
```ruby
def array_concatenation(original, additional)
  # return an array adding the original and additional array together
  # original + additional
  original.concat(additional)
end
```
#### 7.Hashes
- [x] Hash Exercises 
```ruby
def remove_favorite_number(favorite_list)
  # Step 1: delete the number data
  favorite_list.delete(:number)
  # Step 2: return the hash (because Step 1 returns the value of the number key)
  favorite_list
end

def merge_favorites(original_list, additional_list)
  # merge the two hashes: original_list and additional_list
  original_list.merge(additional_list)
end
```
#### 8.Methods
- [x] Method Exercises 
```ruby
# method name: #ascii_translator
# parameter: number (an integer)
# return value: the number's ASCII character (https://www.ascii-code.com/)
# hint: use Integer#chr
def ascii_translator(num)
  num.chr
end

# method name: #common_sports
# parameters: current_sports and favorite_sports (both arrays)
# return value: an array containing items in both arrays
# hint: use Array#intersection 
def common_sports(current_sports, favorite_sports)
  current_sports .intersection(favorite_sports)
end
# other similar function method
union
difference

# method name: #ascii_code
# parameter: character (a string)
# return value: the character's ordinal number
# explicit return value: 'Input Error' if character's length does not equal 1
# hint: use String#ord
def ascii_code(character)
  return 'Input Error' if character.length != 1
  character.ord
end

# method name: #twenty_first_century?
# parameter: year (an integer)
# return value: true if the year is between 2001 - 2100, otherwise return false
# hint: use Comparable#between?
def twenty_first_century?(year)
  year.between?(2001, 2100)
end
```