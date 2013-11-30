class Array
    def map_with_index(&block)
        self.each_with_index.map(&block)
    end
end

arr = [4, 8, 15]
arr.map_with_index() # => [[4, 0], [8, 1], [15, 2]]
