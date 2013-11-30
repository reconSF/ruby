#!/usr/local/bin/ruby

##
# @file      strings.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Simple string manipulation in Ruby.@EOL
# @Keywords  ruby example strings
# @Std       Ruby 1.8
#
#            This example is still a work in progress
#

aVar = 'HELLO'

# With single quoted strings, you get what you type.
puts('SINGLE', '  ABCD', '  AB\tCD', '  AB#{1.abs()}CD', '  #{aVar}')

# With double quoted strings, we get substitution (perl-esq)
puts("DOUBLE", "  ABCD", "  AB\tCD", "  AB#{1.abs()}CD", "  #{aVar}")

# Shell/Perl-like "here" documents
bigString = <<END_OF_TEXT
This is a here
document
END_OF_TEXT

# The "big string", C-like pattern is to split as in C, but use +
anotherBigString = "A common idiom is to put  " +
    "big strings together like this"

# You can't expect integers and the like to be magically transformed
# into strings when the need presents itself like in Perl.  Other
# object types must be serialized into strings first.  Most objects
# have a method .to_s() that will do the trick:
puts(2.to_s() + " hello")
puts(2.0.to_s() + " hello")

# Many objects can be transformed back
puts("2".to_i())
puts("2".to_f())

# Some functions operate in place on the calling object, while others
# simply return a new value.  Generally, the ones with an exclamation
# sign at the end are the ones that operate in place.
puts("In pace operations:")
aString = "hello"
puts(aString.reverse.inspect)
puts(aString.inspect)
aString.reverse!
puts(aString.inspect)

# Unlike Perl, Ruby strings may be manipulated like an array of characters:
puts("String parts:")
puts("abcdef"[1].inspect)                     # Char 1 as a fixnum -- not a string or char
puts("abcdef"[1].chr.inspect)                 # Char 1 as a char
puts("abcdef"[1,1].inspect)                   # Char 1 as a 1 element long string
puts("abcdef"[2..3].inspect)                  # Char 2 till 3
puts("abcdef".slice(2,3).inspect)             # Char 2 till 3
puts("abcdef"[3..-1].inspect)                 # Char 3 to the end
puts("abcdef"[-1,1].inspect)                  # Last char
puts("abcdef"[-4..-1].inspect)                # Fourth to last to end
puts("abcdef"[-4..2].inspect)                 # Two chars starting at Fourth to last
puts("abcdef"[2,1].inspect)                   # Start at 2, get 1 char
puts("abcdef".slice(/b.*e/).inspect)          # Extract regex match (nil if no match)
puts("abcdef".slice(/(a.c)(d.f)/, 2).inspect) # Extract second sub-match from regex (nil if no match)

# Sub-strings of strings are lvalues
puts("Assigning to sub-strings")
aString = "abcdefghij"
puts(aString)
aString[2,3] = "CDE"
puts(aString)
aString[6..8] = "GHI"
puts(aString)

# Iterate over bytes with each_byte or lines with each_line
puts("String iteration")
"abcd".each_byte { |c|
    print(" >#{c}< ")
}
puts()

# split works like Perl, but scan shows ruby goodness.  Note the
# pattern for scan is the thing we WANT, not the thing that separates
# the things we want.  Of course you can do split().each too!  This
# makes scan much like the tokenize APIs in other languages.
puts("String tokenize")
"a,b,c,d".scan('[^,]') { |f|
    print(" >#{f}< ")
}

# Ruby has an inherent ordering on characters, and that ordering leads
# to the obvious lexicographical ordering for strings.  Ruby supports
# order arithmetic (increment/decrement) based upon this ordering as
# well as iteration.  Very handy for cryptographic applications.
puts("String Arithmetic")
puts("aaaa".next)
puts("aaaa".succ)
"aaaa".upto("aaad") { |s|
    print(" #{s} ")
}
puts

# Ruby has a ton of string manipulation tools.  Some of them include:
#
#   Case conversion: capitalize, capitalize!, downcase, downcase!, swapcase, swapcase!, upcase, upcase!
#   Padding: center, ljust, rjust
#   Remove leading/trailing whitespace: chomp, chomp!, lstrip, lstrip!, rstrip, rstrip!, strip, strip!
#   Substring search: count, index, rindex, include?
#   Extract parts: slice, slice!, []
#   Search & replace: sub, sub!, gsub, gsub!
#   Comparison: casecmp, <=>, eql?
#   tr-like: delete, delete!, tr, tr!, tr_s, tr_s!, squeeze, squeeze!
#   Concatenation: concat, +, <<
#   String reversal: reverse, reverse!
#   Length: length
#   Conversion to other types: to_f, to_i, to_s, to_str, to_sym, hex, oct
#   String arithmetic & arithmetic iteration: upto, next, next!, succ, succ!
#   iteration: each (same as line_line), each_byte, each_char, each_line
#   Tokenize/split: scan, split, unpack
#   Boolean tests: empty?, is_binary_data?
#   Other: insert