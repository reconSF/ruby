#!/usr/local/bin/ruby

##
# @file      arrayAssoc.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Associative arrays in ruby.@EOL
# @Keywords  ruby example associative arrays
# @Std       Ruby 1.8
#
#            Ruby has a primitive concept of associative arrays that
#            are very much in the grand tradition of lisp -- i.e. a
#            list of tuples.  Such objects are obtained when coercing
#            a hash into an array -- via a call like .to_a, .sort,
#            etc..  Note: aHash.sort == aHash.to_a.sort.
#
#            Being just an array of arrays, things like
#            .each_with_index, .each_index, .each, and .reverse_each
#            work as expected.


anAssocArray = [ [1, 'a'], [3, 'b'], [2, 'c'], [4, 'd'], [7, 'e'], [6, 'f'] ]

# Iterate over values, but note parallel assignment block parameter
print("Values:        ")
anAssocArray.each do |xValue, yValue|
    print(" (#{xValue}, #{yValue})")
end
print("\n")

# Sort the array.  Note it sorts on first element.
# Also note the parallel assignment block parameter
print("Values Sorted: ")
anAssocArray.sort.each do |xValue, yValue|
    print(" (#{xValue}, #{yValue})")
end
print("\n")

# Note:assoc and rassoc -- only find FIRST matching occurrence ...
print("Element associated with '3' -- i.e. '3' first in tuple:          #{anAssocArray.assoc(3).inspect}\n");
print("Element reverse associated with 'b' -- i.e. 'b' second in tuple: #{anAssocArray.rassoc('b').inspect}\n");
