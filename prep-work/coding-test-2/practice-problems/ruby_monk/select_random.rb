# Create a method 'random_select' which, when given an array of elements (array) and a number (n)
# and returns n randomly selected elements from that array.

def random_select(array, n)
    randnums = []
    n.times {
        array.shuffle
        prng = Random.new
        randnums << array[prng.rand(0..array.length)]
    }
    randnums
end
