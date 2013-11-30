def reverser(result = "hello")
    result = yield
    result.split(" ").collect! { |s| s.reverse }.join(" ")
end

def adder(n=1)
	int = yield(n)
	int + n
end

def repeater(n=1)
    n.times { yield }
end
