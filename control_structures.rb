#!/usr/bin/ruby

# Ruby control structures

# Each
class User
  def initialize(score=0, is_admin=false)
    @score = score
    @is_admin = is_admin
  end

  def is_admin?()
    print  @is_admin 
    print ' '
    return @is_admin
  end

  def update_score(value)
    @score = value + @score
    puts @score
  end
end

array = []
10.times {array << User.new}

def scoring(array)
  # iterate through each of the element in array using *each* and call
   # update_score on it.
  array.each do |user|
    user.update_score(rand(10))
  end
end

scoring(array)

# Unless
5.times {array << User.new(score=0, is_admin=true)}

def scoring_2(array)
  # update_score of every user in the array unless the user is admin
  array.each do |user|
    user.update_score(rand(10)) unless user.is_admin?
  end
end

scoring_2(array)

# Infinite loop
# Form of: loop do end. Break to escape.
loop do
  if true
    break
  end  
  # or as a one lineer
  break if true
end

# Until
# Until is the logical equivalent of while not. 
while not true
  puts 'something'
end
# same as
until true
  puts 'something'
end
# or in one line, <code> until <condition>
puts 'something' until true

puts ' '

# Cases
def identify_class(obj)
  cls = obj.class.name
  case cls
  when "Hacker"
    puts "It's a Hacker!"
  when "Submission"
    puts "It's a Submission!"
  when "TestCase"
    puts "It's a TestCase!"
  when "Contest"
    puts "It's a Contest!"
  else
    puts "It's an unknown model"
  end
end

identify_class(10)
class Hacker
end
c = Hacker.new
identify_class(c)
