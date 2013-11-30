
##
# @file      hashOfHashAndArray.rb
# @author    Mitch Richling <http://www.mitchr.me/>
# @Copyright Copyright 2006 by Mitch Richling.  All rights reserved.
# @brief     Traverse a hash of arrays and hashes in ruby.@EOL
# @Keywords  ruby example hash case introspection
# @Std       Ruby 1.8
#
#            A common Perl idiom is to use a hash containing arrays
#            and hashes for complex hierarchical data.  Such data
#            structures must be traversed without previous knowledge
#            of the data type (array or hash) each hash value holds.
#            This script uses introspection and the Ruby case
#            statement to help traverse such a data structure.

# We need some data...
aHash=Hash::new

aHash['hello'] = Hash::new
aHash['hello']['howy']=1
aHash['hello']['dowy']=1.2

aHash['world'] = Array::new
aHash['world'][1] = 1
aHash['world'][2] = 2

# Now we print the structure.
aHash.each do |key, value|
    case value
        when Hash
            puts("HASH")
            value.each do |skey, svalue|
                puts("  aHash[#{key}][#{skey}]=#{svalue}")
            end
        when Array
            puts("ARRAY")
            value.each_with_index do |svalue, idx|
                puts("  aHash[#{key}][#{idx}]=#{svalue}")
            end
    end
end

# In the loop above, note the use of the === comparison feature of the
# case statement to determine the class of value.  This might have been
# done with an if-elsif-end construct something like the following:
#      if value.class == Hash then
#      elsif value.class == Array then
#      end