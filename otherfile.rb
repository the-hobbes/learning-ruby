require 'somefile'  # fails
require './somefile'  # works
require 'somefile.rb'  # fails
require_relative 'somefile'  # works

