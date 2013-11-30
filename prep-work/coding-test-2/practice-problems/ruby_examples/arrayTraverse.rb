#!/usr/local/bin/ruby

##
# @file      arrayTraverse.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Various array traversal methods.@EOL
# @Keywords  ruby example array traversal
# @Std       Ruby 1.8

anArray = [ 1, 3, 2, 4, 5, 7, 4 ]

# Iterate over both index and value
print("Index/value pairs: ")
anArray.each_with_index do |value, index|
    print(" (#{index},#{value})")
end
print("\n")

# Iterate over indexes
print("Indexes: ")
anArray.each_index do |index|
    print(" #{index}")
end
print("\n")

# Iterate over values
print("Values: ")
anArray.each do |value|
    print(" #{value}")
end
print("\n")

# Iterate over values in reverse order
print("Values in reverse: ")
anArray.reverse_each do |value|
    print(" #{value}")
end
print("\n")

# Iterate over values in sorted order
print("Values Sorted: ")
anArray.sort.each do |value|
    print(" #{value}")
end
print("\n")