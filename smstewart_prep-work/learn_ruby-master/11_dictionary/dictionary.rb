class Dictionary
    
    def entries()
        @entries ||= {}
	end
	
	def add(entry)
		case entry
			when Hash
				entries.merge!(entry)
			when String
				entries[entry] = nil
		end
	end

	def keywords()
		@entries.keys.sort
    end
    
    def include?(key)
		entries.include?(key)
    end
    
	def find(entry)
        result = {}
        entries.select { |k, v| result[k] = v if k.include?(entry) }
    
        result 
	end
	
	def printable()
		result = []
		
		@entries.each { |k, v| result << %Q{[#{k}] "#{v}"} }
		result.sort.join("\n")
	end
end
