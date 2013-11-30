def add(x1, x2)
	x1 + x2
end

def subtract(x1, x2)
	x1 - x2
end

def sum(arr)
	total = 0
	arr.each { |x|
		total += x
	}
	
	total
end

def multiply(array)
  total = 1.0
  array.each { |i|
    total *= i
  }
  total
end

def power(b, e)
    b ** e
end

def factorial(n)
	(1..n).reduce(:*) || 1
end
