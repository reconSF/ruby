class RPNCalculator

	attr_accessor :s

	def initialize()
		@s = []
	end


	def push(n)
		s.push(n.to_f)
	end


	def plus()
		s.push(final + final)
	end

	def value()
		s[-1]
	end

	def minus()
		s.push(0 - final + final)
	end

	def divide()
		divisor = final
		s.push(final / divisor)
	end

	def times()
		s.push(final * final)
	end

	def final()
		if s.empty?
			raise 'calculator is empty'
		end
		s.pop
	end

	def tokens(f)
		f.split(" ").map { |x|
			if x == '*' or x == '+' or x == '-' or x == '/'
				x.to_sym
			else
				x.to_f
			end
		}
	end

	def evaluate(f)
		tokens(f).each { |a|
			if a == :+
				plus
			elsif a == :-
				minus
			elsif a == :*
				times
			elsif a == :/
				divide
			else
				push a
			end      
		}
	
		value
	end
end