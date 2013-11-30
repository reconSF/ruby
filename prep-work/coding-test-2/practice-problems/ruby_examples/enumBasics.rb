#!/usr/local/bin/ruby

##
# @file      enumBasics.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2007 by Mitch Richling.  All rights reserved.
# @brief     Some of the Ruby's enumerable goodness.@EOL
# @Keywords  ruby example enumerable hash array
# @Std       Ruby 1.8
#
#            Ruby has the concept of "enumerable types", and deals
#            with them in a way similar to the way Lisp deals with
#            sequences.  Array & Hash are the most frequently
#            encountered enumerable types.  Hashes mostly work like
#            associative arrays when enum methods are used on them.
#            It is also important to remember that with associative
#            arrays and hashes, one can use parallel assignment in the
#            block argument variable.
#
#            This example is still a bit of a work in progress.

arr1  = [ 1, 4, 2, 3, 6, 5, 3, 4 ]          # Typical array
arr2  = [ [1,4], [2,3], [6,5], [3,4] ]      # Classic lisp-like associative array structure
hsh1  = { 1 => 4, 2 => 3, 6 => 5, 3 => 4 }  # Typical hash

puts("OUR TEST LISTS")
puts("  arr1 = #{arr1.inspect}")
puts("  arr2 = #{arr2.inspect}")
puts("  hsh1 = #{hsh1.inspect}")

puts("ELEMENT-WISE BOOLEAN OPERATIONS")
puts("  arr1.all? {|x| x<7}  = #{(arr1.all? {|x| x<7}).inspect         }")
puts("  arr1.all? {|x| x<6}  = #{(arr1.all? {|x| x<6}).inspect         }")
puts("  arr2.all? {|x,y| x>y}  = #{(arr2.all? {|x,y| x>y}).inspect     }")
puts("  arr2.all? {|x| x.max<7}  = #{(arr2.all? {|x| x.max<7}).inspect }")
puts("  hsh1.all? {|k,v| k<7}  = #{(hsh1.all? {|k,v| k<7}).inspect     }")
puts("  hsh1.all? {|k,v| k<6}  = #{(hsh1.all? {|k,v| k<6}).inspect     }")

puts("MAX/MIN")
puts("  arr1.max    = #{arr1.max.inspect       }")
puts("  arr1.min    = #{arr1.min.inspect       }")
puts("  arr2.max    = #{arr2.max.inspect       }")
puts("  arr2.min    = #{arr2.min.inspect       }")
puts("  hsh1.max    = #{hsh1.max.inspect       }")
puts("  hsh1.min    = #{hsh1.min.inspect       }")

puts("COERCION INTO AN ARRAY") # Also See: to_a
puts("  arr1.entries  = #{arr1.entries.inspect   }")
puts("  arr2.entries  = #{arr2.entries.inspect   }")
puts("  hsh1.entries  = #{hsh1.entries.inspect   }")  # Note the order may not be as initialized!

puts("INJECT -- VERY LISPY")
puts("  arr1.inject {|sum, x| sum+x } = #{(arr1.inject {|sum, x| sum+x }).inspect    }")
puts("  arr2.inject {|sum, x| sum+x } = #{(arr2.inject {|sum, x| sum+x }).inspect    }")
puts("  hsh1.inject {|sum, x| sum+x } = #{(hsh1.inject {|sum, x| sum+x }).inspect    }")

puts("MAP -- VERY LISPY")  # Also See: collect
puts("  arr1.map {|x| x*x } = #{(arr1.map {|x| x*x }).inspect       }")
puts("  arr2.map {|x,y| x*y } = #{(arr2.map {|x,y| x*y }).inspect   }")
puts("  arr2.map {|x| x.max } = #{(arr2.map {|x| x.max}).inspect    }")

puts("CHECKING MEMBERSHIP") # Also See: include?
puts("  arr1.member?(2)     = #{arr1.member?(2).inspect     }")
puts("  arr2.member?(2)     = #{arr2.member?(2).inspect     }")  # NOTE: See .assoc & .rassoc
puts("  arr2.member?([2,3]) = #{arr2.member?([2,3]).inspect }")  # NOTE: See .assoc & .rassoc
puts("  hsh1.member?(6)     = #{hsh1.member?(6).inspect     }")  # NOTE: You get the Hash::member?
puts("  hsh1.member?(5)     = #{hsh1.member?(5).inspect     }")

puts("FINDING FIRST MATCH") # Also See: detect
puts("  arr1.find {|x| x>2}    = #{(arr1.find {|x| x>2}).inspect   }")
puts("  arr2.find {|x,y| x>2}  = #{(arr2.find {|x,y| x>2}).inspect }")
puts("  hsh1.find {|k,v| k<5}  = #{(hsh1.find {|k,v| k<5}).inspect }")

puts("FINDING ALL MATCHES") # Also See: select
puts("  arr1.find_all {|x| x>2}    = #{(arr1.find_all {|x| x>2}).inspect   }")
puts("  arr2.find_all {|x,y| x>2}  = #{(arr2.find_all {|x,y| x>2}).inspect }")
puts("  hsh1.find_all {|k,v| k<5}  = #{(hsh1.find_all {|k,v| k<5}).inspect }")
puts("  arr1.grep(2)               = #{arr1.grep(2).inspect                }")

puts("SORT")
puts("  arr1.sort  = #{(arr1.sort).inspect  }")
puts("  arr2.sort  = #{(arr2.sort).inspect  }")  # Note lexicographical ordering for vectors

puts("  arr1.sort {|a,b| b<=>a} = #{(arr1.sort {|a,b| b<=>a}).inspect  }")
puts("  arr2.sort {|a,b| b<=>a} = #{(arr2.sort {|a,b| b<=>a}).inspect  }")  # Note lexicographical ordering for vectors

puts("SORT BY")
puts("  arr1.sort_by {|x| x.abs}  = #{(arr1.sort_by {|x| x.abs}).inspect  }")
puts("  arr2.sort_by {|x| x.max}  = #{(arr2.sort_by {|x| x.max}).inspect  }")

puts("PARTITION")
puts("  arr1.partition {|x| x.abs>3}  = #{(arr1.partition {|x| x.abs>3}).inspect  }")
puts("  arr2.partition {|x| x.max<4}  = #{(arr2.partition {|x| x.max<4}).inspect  }")

puts("ZIP (RESHAPE IN R)")
puts("  arr1.zip(arr1.reverse)  = #{arr1.zip(arr1.reverse).inspect  }")

puts("GETTING RID of STUFF")
puts("  arr1.reject {|x| x>2}    = #{(arr1.reject {|x| x>2}).inspect   }")
puts("  arr2.reject {|x,y| x>2}  = #{(arr2.reject {|x,y| x>2}).inspect }")
puts("  hsh1.reject {|k,v| k<5}  = #{(hsh1.reject {|k,v| k<5}).inspect }")

puts("TRAVERSAL OVER INDEX AND VALUES")
print("   arr1 = ")
arr1.each_with_index { |x,i| print("(#{i},#{x}) ") }
print("\n")
print("   arr2 = ")
arr2.each_with_index { |x,i| print("(#{i},#{x.inspect}) ") }
print("\n")
print("   hsh1 = ")
hsh1.each_with_index { |x,i| print("(#{i},#{x.inspect}) ") }
print("\n")

#puts("TRAVERSAL OVER SLICES AND CONS")
#print("   arr1(cons)  -> ")
#arr1.each_cons(2) { |x| print("(#{x.inspect}) ") }
#print("\n")
#print("   arr1(slice) -> ")
#arr1.each_slice(2) { |x| print("(#{x.inspect}) ") }
#print("\n")