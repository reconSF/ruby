#!/usr/local/bin/ruby

##
# @file      regex.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Basic regular expressions in Ruby.@EOL
# @Keywords  ruby example regex regular expressions
# @Std       Ruby 1.8

testString1 = "abcdefghiabcdefghi"

# Constructing new regex objects is easy
aRe1 = /bc.e/
aRe2 = Regexp.new('bc.e', Regexp::EXTENDED | Regexp::IGNORECASE | Regexp::MULTILINE)
aRe3 = /(bc.e).*(bc.ef)/

# We can get various bits of meta-data about a regex
puts("Various bits of meta-data about aRe2:")
puts("  #{aRe2.source                              }") # Original string regex constructed from
puts("  #{aRe2.inspect                             }") # Nicely render our regex as a string
puts("  #{aRe2.to_s                                }") # Similar to .inspect, but display options too
puts("  #{aRe2.options                             }") # fixnum with options
puts("  #{!(aRe2.options&Regexp::EXTENDED).zero?   }")
puts("  #{!(aRe2.options&Regexp::IGNORECASE).zero? }")
puts("  #{!(aRe2.options&Regexp::MULTILINE).zero?  }")
puts("  #{aRe2.casefold?.inspect                   }")

puts("Using .match:")
aMatchObj = aRe3.match("abcdefghiabcdefghi")  # Note that .match is in String too!
puts("  #{aMatchObj[0]}")
puts("  #{aMatchObj[1]}")
puts("  #{aMatchObj[2]}")

# If you have a string you wish to use as a regex, any special chars must be quoted.
aString = Regexp.quote('hel//o.*o')
puts(".quote: #{aString}")

# Regexp.union is a handy way to build up a big regex or'ed from smaller ones.
aRe4 = Regexp.union("dog", "cat", "rat")  # match "dog", "cat", or "rat"
puts(".union: #{aRe4.inspect}")

# Several regex functions are part of String.  See the string examples
# for more info.

# =~ will match a string to a regex, and return the index of the match or nill
puts("=~: #{(testString1 =~ /bc.e/).inspect}")
puts("=~: #{(testString1 =~ /Bc.e/).inspect}")

# Search and replace via .sub and gsub in String (in-place versions: .sub! & .gsub!)
puts("sub:  #{testString1.sub(aRe1, "FOO")   }")  # Replace first
puts("gsub: #{testString1.gsub(aRe1, "FOO")  }")  # Replace all

# Extract sub-strings via regex (a.slice(foo) === a[foo])
puts("slice: #{testString1.slice(aRe1)        }")  # Extract matching stuff
puts("slice: #{testString1.slice(aRe3, 2)     }")  # Extract matching sub-string
