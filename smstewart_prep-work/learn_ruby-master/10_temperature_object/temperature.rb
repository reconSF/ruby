class Temperature

	def initialize(args)
		@in_f = args[:f] || ctof(args[:c])
		@in_c = args[:c] || ftoc(@in_f)
	end
	
	
	def Temperature.from_celsius(c)
		new(:c => c)
	end
	
	def Temperature.from_fahrenheit(f)
		new(:f => f)
	end
	
	def in_fahrenheit()
		@in_f
	end
	
	def in_celsius()
		@in_c
	end
	
	def ftoc(temp)
		(temp - 32) * (5.0 / 9.0)
	end

	def ctof(temp)
		temp * (9.0 / 5.0) + 32
	end	
end

class Celsius < Temperature
	def initialize(c)
		super(:c => c)
	end
end

class Fahrenheit < Temperature
	def initialize(f)
		super(:f => f)
	end
end




