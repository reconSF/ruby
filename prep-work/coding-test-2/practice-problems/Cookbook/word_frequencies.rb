class String
    def word_count
        frequencies = Hash.new(0)
        downcase.scan(/\w+/) { |word| frequencies[word] += 1 }
        return frequencies
    end
end

%{Dogs dogs dog dog dogs.}.word_count # => {"dogs"=>3, "dog"=>2}

%{"I have no shame," I said.}.word_count # => {"no"=>1, "shame"=>1, "have"=>1, "said"=>1, "i"=>2}

