# Given a custom class MyArray,
# write a 'sum' method that takes a block parameter.

class MyArray
    attr_reader :array

    def initialize(array)
        @array = array
    end

    def sum(initial_value = 0)
        array.inject(0) { |acc, i| initial_value += i }
        initial_value
    end
end

array = MyArray.new([1,2,3])
# => 6

array.sum(10)
# => 16
