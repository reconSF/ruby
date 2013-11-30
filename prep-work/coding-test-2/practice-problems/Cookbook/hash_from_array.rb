# To turn a flat array into the key-value pairs of a hash, iterate over the array elements
# two at a time

class Array
    def into_hash(h)
        unless size % 2 == 0
            raise StandardError, "Expected array with even number of elements"
        end
        0.step(size-1, 2) { |x| h[self[x]] = self[x+1] }
        h
    end
end

squares = [1,1,2,3,4,9]
results = {}
squares.into_hash(results)
# => {1=>1, 2=>3, 4=>9}
