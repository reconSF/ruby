#Create a method named 'sort_string' which accepts a String and
# rearranges all the words in ascending order, by length.
# Let's not treat the punctuation marks any different than other characters and assume
# that we will always have single space to separate the words.

def sort_string(string)
    string.split(' ').sort { |a, b| a.length <=> b.length }.join(' ')
end

# sort_string("This is a string please sort me")
# => "a me is sort This please string"