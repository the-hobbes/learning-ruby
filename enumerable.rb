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

# Enumerables: checking values within an object.
def func_any(hash)
    # Check and return true if any key object within the hash is of the type Integer
    # If not found, return false.
    return hash.any? {|key, value| key.is_a?(Integer)}
end

def func_all(hash)
    # Check and return true if all the values within the hash are Integers and are < 10
    # If not all values satisfy this, return false.
    return hash.all? {|key, value| value.is_a?(Integer) && value < 10}
end

def func_none(hash)
    # Check and return true if none of the values within the hash are nil
    # If any value contains nil, return false.
    return hash.none? {|key, value| value.nil?}
end

def func_find(hash)
    # Check and return the first object that satisfies either of the following properties:
    #   1. There is a [key, value] pair where the key and value are both Integers and the value is < 20 
    #   2. There is a [key, value] pair where the key and value are both Strings and the value starts with `a`.
    hash.find do |key, value|
        (key.is_a?(Integer) and value.is_a?(Integer) and value < 20) or
        (key.is_a?(String) and value.is_a?(String) and value.start_with?("a"))
    end
end

# Enumerable: group_by
def group_by_marks(marks, pass_marks)
  # your code here
    marks.group_by {|key, value| value >= pass_marks ? "Passed" : "Failed"}
end

