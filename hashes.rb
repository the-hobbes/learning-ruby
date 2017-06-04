#!/usr/bin/ruby

# Hash == associative array == python dict
# Initialization
# Initialize an empty Hash with the variable name empty_hash
empty_hash = Hash.new 

# Initialize an empty Hash with the variable name default_hash and the default value of every key set to 1...
default_hash = Hash.new(1) 
# ...or...
default_hash = Hash.new
default_hash.default = 1 

# Initialize a hash with the variable name hackerrank and having some key-value pairs 
hackerrank = {"simmy" => 100, "vivmbbs" => 200} 

# Hash can be defined using a new method 
hackerrank = Hash.new
hackerrank["simmy"] = 100
hackerrank["vivmbbs"] = 200

# hash control structure: each
def iter_hash(hash)
    hash.each do |arr|
        puts arr[0]
        puts arr[1]
    end
    
    hash.each do |key, value|
        puts key
        puts value
    end
end

# Hash - Addition, Deletion, Selection
hackerrank = Hash.new
hackerrange.default = 0
# A key-value pair [543121, 100] to the hackerrank object
hackerrank.store(543121, 100)  # key, value
# or...
hackerrank[543121] = 100

# Retain all key-value pairs where keys are Integers
hackerrank.keep_if {|key, value| key.is_a? Integer}
# or...
hackerrank.delete_if {|key, value| key.is_a? Integer == false}

# Delete all key-value pairs where keys are even-valued 
hackerrank.delete_if {|key, value| key % 2 == 0}
# or...
hackerrank.keep_if {|key, value| key % 2 != 0}

