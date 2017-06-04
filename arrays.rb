#!/usr/bin/ruby

arr = [9, 5, 1, 2, 3, 4, 0, -1]
puts arr[4]
puts arr.at(4)
puts arr[4] == arr.at(4)

arr[1..3] # .. indicates both indices are inclusive.
arr[1...3] # ... indicates the last index is excluded.
arr[1,4] # start index and length of the range

def element_at(arr, index)
    # return the element of the Array variable `arr` at the position `index`
    # arr.at(index) # or
    # arr[index]
    return arr[index]
end

def inclusive_range(arr, start_pos, end_pos)
    # return the elements of the Array variable `arr` between the start_pos and end_pos (both inclusive)
    return arr[start_pos..end_pos]
end

def non_inclusive_range(arr, start_pos, end_pos)
    # return the elements of the Array variable `arr`, start_pos inclusive and end_pos exclusive
    return arr[start_pos...end_pos]
end

def start_and_length(arr, start_pos, length)
    # return `length` elements of the Array variable `arr` starting from `start_pos`
    return arr[start_pos,length]
end

# To access the elements from the end of the list, we can use negative indices
arr = [9, 5, 1, 2, 3, 4, 0, -1]
puts 'should print true'
puts arr[-1] == -1

# first and last elements accessed by arr.first and arr.last
arr.first

# first n elements can be accessed with take
puts arr.take(3) == [9, 5, 1]

# Everything but the first n elements of the array can be accessed using
puts arr.drop(3) == [2, 3, 4, 0, -1]

def neg_pos(arr, index)
    # return the element of the array at the position `index` from the end of the list
    # Clue : arr[-index]
    return arr[-index]
end

def first_element(arr)
    # return the first element of the array
    # arr.first
    return arr.first
end

def last_element(arr)
    # return the last element of the array
    # arr.last
    return arr.last
end

def first_n(arr, n)
    # return the first n elements of the array
    return arr.take(n)
end

def drop_n(arr, n)
    # drop the first n elements of the array and return the rest
    return arr.drop(n)
end


# Adding elements to arrays
def end_arr_add(arr, element)
    # Add `element` to the end of the Array variable `arr` and return `arr`
    arr.push(element)
    return arr
end

def begin_arr_add(arr, element)
    # Add `element` to the beginning of the Array variable `arr` and return `arr`
    arr.unshift(element)
    return arr
end

def index_arr_add(arr, index, element)
    # Add `element` at position `index` to the Array variable `arr` and return `arr`
    arr.insert(index, element)
end

def index_arr_multiple_add(arr, index, *args)
    # add any two elements to the arr at the index
    arr.insert(index, *args)
    return arr
end

puts 'This should print [1, "herp", "derp", 2]'
print index_arr_multiple_add([1, 2], 1, 'herp', 'derp')
print "\n"

# Initializing arrays
# Initialize an empty array with the variable name array 
array = Array.new  # or array = []

# Initialize an array with exactly one nil element in it with the variable name array_1 
array_1 =[nil]  # or array_1 = Array.new(1) 

# Initialize an array with exactly two elements with value 10 in it using the variable name array_2 
array_2 = Array.new(2, 10)  # or array_2 = [10, 10]

# Deletions
def end_arr_delete(arr)
    # delete the element from the end of the array and return the deleted element
    return arr.pop
end

def start_arr_delete(arr)
    # delete the element at the beginning of the array and return the deleted element
    return arr.shift
end

def delete_at_arr(arr, index)
    # delete the element at the position #index
    arr.delete_at(index)
end

def delete_all(arr, val)
    # delete all the elements of the array where element = val
    arr.delete(val)
end

# Selecting elements
# Note: a block is a group of code within {} that accepts a variable and returns a value.
def select_arr(arr)
  # select and return all odd numbers from the Array variable `arr`
    return arr.select {|a| a % 2 != 0}
end

def reject_arr(arr)
  # reject all elements which are divisible by 3
    return arr.reject {|a| a % 3 == 0}
end

def delete_arr(arr)
  # delete all negative elements
    arr.delete_if {|a| a < 0}
end

def keep_arr(arr)
  # keep all non negative elements ( >= 0)
    arr.keep_if {|a| a >= 0}
end

