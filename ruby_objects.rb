#!/usr/bin/ruby

puts 'What is the value of self?'
puts self

# everything in ruby is an object, and some have built-in methods.
number = 10
puts 'Is 10 even?'
puts number.even?
number = 11
puts 'Is 11 even?'
puts number.even?

=begin
In Ruby, the ? operator is code style convention that indicates a
method's return value should be a boolean. It doesn't mean the method
must return boolean, but that it should.
isEmpty(), isDigit() in some languages becomes ==> empty?, digit? in
Ruby.
=end

b = 1
c = 10
a = 11
z = 5
puts '11 is between 1 and 10'
puts a.between?(b, c)
puts '5 is between 1 and 10'
puts z.between?(b, c)

