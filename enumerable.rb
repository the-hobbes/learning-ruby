#!/usr/bin/ruby

# Ruby provides an Enumerable module which packages a bunch of methods
# which can be used with any other class by including it (referred to
# as mixing in). 
# As long as the custom object defines an each method and includes
# Enumerable module, it can get access to all of its magic. 

# You have been provided with a custom object called colors that
# defines its own each method. You need to iterate over the items and
# return an Array containing the values. 
def iterate_colors(colors)
    a = []
    colors.each do |arr|
        a.push(arr)
    end
    return a
end

# Enumerable - each_with_index
# each_with_index  allows you to iterate over items along with an
# index keeping count of the item.

def skip_animals(animals, skip)
    # =begin
    #    Args:
    #        animals (array)
    #        skip (integer)
    #    Return an array of all elements in animals except the
    #    first skip number of items.
    # =end
    a = []
    animals.each_with_index do |val, index|
        if (index >= skip)
            a.push("#{index}:#{val}")
        end
    end
    return a
end

# Enumerable - collect
# Map, aka collect, takes a function and maps (applies) it to a
# collection of values one by one and returns the collection of
# result. 
# Note that these methods are different from each in the respect
# that these methods return a new collection while former
# returns the original collection, irrespective of whatever
# happens inside the block. 

# e.g., multiply every item in an array by 2
[1,2,3].map { |x| 2*x }

def rot13(secret_messages)
  # Take and array of strings encoded in ROT13 and decode them.
  # see https://en.wikipedia.org/wiki/ROT13#Implementation and
  # https://apidock.com/ruby/String/tr
  # # Map upper case A-Z to N-ZA-M and lower case a-z to n-za-m
  secret_messages.map { |c| c.tr("A-Za-z", "N-ZA-Mn-za-m") }
end

puts rot13(['Jul qvq gur puvpxra pebff gur ebnq?'])

# Enumerable - reduce
# Perform a single type of operation with all the elements and collect
# the result (e.g., sum all the values in an array).


