def calculate(x, y)
    yield(x, y)
end

calculate(2, 3) { |a, b| a + b } # => 6
calculate(2, 3) { |a, b| a - b } # => 16
calculate(2, 3) { |a, b| a * b } # => 6