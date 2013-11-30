#!/usr/local/bin/ruby

##
# @file      setBasics.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Sets in Ruby.@EOL
# @Keywords  ruby example set
# @Std       Ruby 1.8

require 'set'

# Sets may be constructed empty, or from an array
a = Set.new([1, 2.3, 3.14, 'hello'])

# We can add stuff to the set later.
a.add('addedLater')

# We can take stuff out of the set later too
a.delete(3.14)

# Sets only hold ONE copy of an object -- jut like sets in math
a.add(1)
a.add(1)

# We can iterate via each
print("ELE:")
a.each do |x|
    print(" '#{x}'")
end
print("\n")

if(a.member?(1)) then
    print("'1' IS A MEMBER\n")
end

if (!a.empty?) then
    print("The list is NOT empty\n")
end

# Classify breaks a set in to a hash of sets with keys
# based upon the classification criteria.  See divide too.
classHash = a.classify { |x| x.class }
puts("Class Hash: #{classHash.inspect}")

# The list can be emptied
a.clear

if (a.empty?) then
    print("The list is empty now!\n")
end

# Useful methods:
#   Set operations (all take enums): difference, intersection, merge, replace, subtract, union
#   Set Booleans (all take sets): subset?, proper_subset?, proper_superset?, superset?
#   Classification: classify, divide
#   Others: delete_if, collect!