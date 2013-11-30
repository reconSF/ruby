# Find primes within a given max

def sieve(max=100)
    sieve = []
    (2..max).each { |i| sieve[i] = i }
    (2..Math.sqrt(max)).each do |i|
        (i*i).step(max, i) { |j| sieve[j] = nil } if sieve[i]
    end
    sieve.compact
end
