class Array
	def sum()
		total = 0
		
		self.each { |x| total += x }
		total
	end
	
	def square()
		self.collect { |x| x*x }
	end

	def square!()
		self.collect! { |x| x*x }
	end
end
