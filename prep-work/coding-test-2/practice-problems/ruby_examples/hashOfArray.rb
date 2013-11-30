#!/usr/local/bin/ruby

##
# @file      hashOfArray.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Building up a hash of arrays.@EOL
# @Keywords  ruby example hash array perl
# @Std       Ruby 1.8
#
#            A common Perl idiom is to use a hash of arrays to
#            categorize data -- the hash is built up as new data
#            categories are discovered, and data is pushed onto the
#            arrays for the appropriate category.  This example
#            program shows a few Ruby recipes for doing the same
#            thing.
#
#            See the hashOfCounts.rb example too.


data = [ [1, 2], [1, 3], [4, 5] ]

# Probably the most verbose way to do it..
aHash=Hash::new


data.each do |x,y|
    if aHash.member?(x) then   # Note: aHash.member?(x) == !aHash[x].nil?
        aHash[x].push(y)
    else
        aHash[x] = Array.new(1, y)  # or 'Array.new.push(y)', or '[ y ]'
    end
end


puts("===============")
aHash.each do |x,y|
    puts("#{x} : #{y.inspect}")
end

# This is a common ruby idiom
aHash=Hash::new
data.each do |x,y|
    (aHash[x] ||= []).push(y)  # Same as: aHash[x] = (aHash[x] || []); aHash[x].push(y)
end


puts("===============")
aHash.each do |x,y|
    puts("#{x} : #{y.inspect}")
end

# The following is a rather perl-ish way to get it done.  This example
# depends upon the fact that + creates a NEW object, and that + also
# concatenates arrays.
aHash=Hash.new(Array.new)
data.each do |x,y|
    aHash[x] += Array.new(1, y)
end


puts("===============")
aHash.each do |x,y|
    puts("#{x} : #{y.inspect}")
end

# WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
# WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
# WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING
#
# The following code doesn't do what you might expect!!!!
#
# aHash=Hash.new(Array.new) means that every time we evaluate
# aHash[foo] when foo is not already a key, we get the Array.new
# object specified in the constructor -- we get precisely that object,
# and not a copy.  In the following code, we keep pushing y onto the
# array given in the constructor -- so if we evaluate aHash[foo] we
# get an array containing the values we pushed on! For this reason,
# the following code doesn't do what most Perl programmers expect.
aHash=Hash.new(Array.new)
data.each do |x,y|
    aHash[x].push(y)
end


puts("===============")
aHash.each do |x,y|
    puts("#{x} : #{y.inspect}")
end


puts("aHash[0]=#{aHash[0].inspect}")