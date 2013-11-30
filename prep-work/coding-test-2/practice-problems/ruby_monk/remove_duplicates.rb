# Given an Array, return the elements that are present exactly once in the array.

def non_duplicated_values(values)
    values.find_all { |x| values.count(x) == 1 }
end

# non_duplicated_values([1,1,3,2,2,5,6,5])
# => [3, 6]