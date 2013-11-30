def measure(n = 1, &block)
	total = 0
	
	n.times {
		start_time = Time.now
		block.call
		end_time = Time.now
		total += end_time - start_time
	}
	
	total / n
end
