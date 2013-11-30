#!/usr/local/bin/ruby

##
# @file      classVariables.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Class variables/methods in ruby.@EOL
# @Keywords  ruby example class variable method
# @Std       Ruby 1.8

class Person
    # CLASS variable (i.e. every instance shares the same variable/memory)
    @@population = 0

    # Constructor
    def initialize(name)
        @name        = name               # Create and set an INSTANCE variable
        @@population = @@population + 1   # Set the class variable
    end

    # Class method (Normaly class methods are used to access class variables)
    def Person.population
        "C:#{@@population}"
    end

    # Instance method.  Note the name is the SAME as the class method above.  Ruby
    # figures out which to call based upon context!  Also note that the instance
    # method can access the class variable as expected.
    def population
        "I:#{@@population}"
    end
end

mitch = Person.new('Mitch')
puts("Population: #{Person.population}\n") # Calling class method population
puts("Population: #{mitch.population}\n")  # Calling the instance method population

janie = Person.new('Janie')
puts("Population: #{Person.population}\n") # Calling class method population
puts("Population: #{mitch.population}\n")  # Calling the instance method population
puts("Population: #{janie.population}\n")  # Calling the instance method population