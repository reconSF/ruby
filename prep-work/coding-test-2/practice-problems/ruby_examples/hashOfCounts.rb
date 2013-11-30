#!/usr/local/bin/ruby

##
# @file      hashOfCounts.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Building up a hash of counts.@EOL
# @Keywords  ruby example hash array perl counts
# @Std       Ruby 1.8
#
#            A very common Perl idiom is to use a hash to count things
#            in categories.  The Perl idiom replicates the natural SQL
#            construct of COUNT/GROUP BY:
#
#               SELECT foo, COUNT(bar) FROM foobar GROUP BY foo;
#
#            We illustrate two Ruby recipes for doing the same thing.
#
#            See the hashOfArray.rb example too.

data = [ 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3]

# Probably the most verbose way to do it..
aHash=Hash::new
data.each do |x|
    if aHash.member?(x) then
        aHash[x] += 1
    else
        aHash[x] = 1
    end
end
puts("===============")
aHash.each do |x,y|
    puts("#{x} : #{y.inspect}")
end

# The following is probably the most common Ruby way to get this done,
# and it happens to also be rather perl-ish in flavor.  This example
# depends upon the fact that + creates a NEW object.
aHash=Hash.new(0)
data.each do |x|
    aHash[x] += 1
end
puts("===============")
aHash.each do |x,y|
    puts("#{x} : #{y.inspect}")
end
