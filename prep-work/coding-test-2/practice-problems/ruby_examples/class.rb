#!/usr/local/bin/ruby

##
# @file      class.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Simple class concepts in Ruby.@EOL
# @Keywords  ruby example class
# @Std       Ruby 1.8

class Person
    def initialize(name, weight) # Constructor
        @name   = name
        @weight = weight
    end

    attr_reader :name, :weight
    attr_writer :weight

    def weightKG
        @weight * 0.45359237
    end

    def weightKG=(newWeightKG)
        @weight = newWeightKG / 0.45359237
    end
end

mitch = Person.new('Mitch', 250)

puts("Initial Values:")
puts("  Mitch's Name: #{mitch.name}\n")
puts("  Mitch's Wt:   #{mitch.weight}lb\n")
puts("  Mitch's Wt:   #{mitch.weightKG}kg\n")

mitch.weight = 200
puts("After Change:")
puts("  Mitch's Wt:   #{mitch.weight}lb\n")
puts("  Mitch's Wt:   #{mitch.weightKG}kg\n")

mitch.weightKG = 200
puts("Final Change:")
puts("  Mitch's Wt:   #{mitch.weight}lb\n")
puts("  Mitch's Wt:   #{mitch.weightKG}kg\n")