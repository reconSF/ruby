#!/usr/local/bin/ruby

##
# @file      hashBasics.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Simple hash examples in Ruby.@EOL
# @Keywords  ruby example hash
# @Std       Ruby 1.8
#
#            Also see hashTraverse.rb, arrayAssoc.rb, & enumBasics.rb
#            for more examples.  Also note that sort is covered in
#            hashTraverse.rb and arrayAssoc.

# Note any object type can be used for keys or values.
aHash = { 'a'   => '1',
          2     => 'z',
          'r'   => nil,      # String as key
          3     => 1,        # Fixnum as key
          nil   => 'K',      # nil as key
          :sym  => 3   }     # Symbol as key

puts("HASH DEFAULT VALUES")
bHash = Hash.new(0);
puts("   dflt: #{bHash['1'].inspect          }")
puts("   dflt: #{bHash.default.inspect       }")
bHash.default = 1
puts("   dflt: #{bHash.default.inspect  }")

puts("HASH DEFAULT UBER-VALUES")
bHash = Hash.new { |hash, key| "Dude!  #{key} not here!" }
puts("   dflt: #{bHash['1'].inspect          }")
puts("   dflt: #{bHash.default.inspect       }")
puts("   dflt: #{bHash.default_proc.inspect  }")

puts("GETTING VALUES VIA KEYS")
puts("  aHash['a']                            = #{aHash['a'].inspect                               }")
puts("  aHash[nil]                            = #{aHash[nil].inspect                               }")
puts("  aHash['r']                            = #{aHash['r'].inspect                               }")
puts("  aHash['j']                            = #{aHash['j'].inspect                               }")
puts("  aHash.values_at('a', nil)             = #{aHash.values_at('a', nil).inspect                }")
puts("  aHash.fetch('a',   'sorry')           = #{aHash.fetch('a',   'sorry').inspect              }")
puts("  aHash.fetch('nil', 'sorry')           = #{aHash.fetch('nil', 'sorry').inspect              }")
puts("  aHash.fetch('nil') {|k,v| '-'+k.to_s} = #{(aHash.fetch('nil') {|k,v| '-'+k.to_s}).inspect  }")

puts("GETTING KEYS VIA VALUES")
puts("  aHash.index('1') = #{aHash.index('1').inspect}")

puts("HASH META DATA")
puts("  aHash.empty? = #{aHash.empty?.inspect    }")
puts("  aHash.empty? = #{aHash.length.inspect    }")  # Also see: size

# In ruby both keys and values can be nil, false, or true.  This means
# we can't simply test existence of a key by evaluating aHash[foo]!
puts("TESTING FOR KEYS/VALUES")
puts("  aHash.has_key?('a')   = #{aHash.has_key?('a').inspect   }") # Also see: key? & include? & member?
puts("  aHash.has_key?('z')   = #{aHash.has_key?('z').inspect   }")
puts("  aHash.has_value?(1)   = #{aHash.has_value?(1).inspect   }") # Also see: value?
puts("  aHash.has_value?('r') = #{aHash.has_value?('r').inspect }")

puts("ARRAYS FROM HASHES")
puts("  aHash.to_a   = #{aHash.to_a.inspect   }")
puts("  aHash.keys   = #{aHash.keys.inspect   }")
puts("  aHash.values = #{aHash.values.inspect }")

puts("DELETING STUFF")
anEle = aHash.delete('a') # Also see: reject! & select
puts("  After Delete:    aHash=#{aHash.inspect}")
puts("  Thing Deleted:  #{anEle.inspect}")
aHash.delete_if { |k,v| k.nil? }
puts("  After Delete_if: aHash=#{aHash.inspect}")
anEle = aHash.shift
puts("  After shift:     aHash=#{aHash.inspect}")
puts("  Thing shifted:   #{anEle.inspect}")
aHash.clear
puts("  After clear:     aHash=#{aHash.inspect}")
