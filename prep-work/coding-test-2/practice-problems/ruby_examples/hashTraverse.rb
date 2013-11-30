#!/usr/local/bin/ruby

##
# @file      hashTraverse.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Various hash traversal techniques.@EOL
# @Keywords  ruby example hash traversal iterate
# @Std       Ruby 1.8

aHash = { 'aa' => 5, 'b' => 4, 'cc' => 3, 'd' => 2, 'e' => 1}

# Iterate over the keys
print("Keys: ")
aHash.each_key do |key|
    print(" #{key}")
end
print("\n")

# Get array of keys, sort it, and iterate over array
print("Sorted Keys: ")
aHash.keys.sort.each do |key|
    print(" #{key}")
end
print("\n")

# Get array of keys, sort by values, and iterate over array
print("Keys Sorted By Value: ")
(aHash.keys.sort {|a,b| aHash[a]<=>aHash[b]}).each do |key|
    print(" #{key}")
end
print("\n")

# Iterate over the values
print("Values: ")
aHash.each_value do |value|
    print(" #{value}")
end
print("\n")

# Iterate over the pairs
print("Keys & Values: ")
aHash.each_pair do |key, value| # Note: .each_pair == each
    print(" (#{key},#{value})")
end
print("\n")

# Transform hash into associative array with sort, and iterate over
# the sorted array.  See the example arrayAssoc.rb for more.
print("Sorted Keys & Values: ")
aHash.sort.each do |key, value| # Note: .sort == .to_a.sort
    print(" (#{key},#{value})")
end
print("\n")