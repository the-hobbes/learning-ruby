#!/usr/bin/ruby

# first install pry: sudo gem install pry

require 'pry'


class A
  def hello() puts "hello world!" end
end 

a = A.new()

# start a REPL session
binding.pry

puts "program resumes here..."

