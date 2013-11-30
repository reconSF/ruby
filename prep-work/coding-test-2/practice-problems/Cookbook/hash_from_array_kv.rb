# To add an array of key-value pairs to a hash, either iterate over the array with
# Array#each, or pass the hash into Array#inject. Using inject is slower but the code is
# more concise


squares = [[1,1], [2,4], [3,9]]
results = {}

squares.each { |k,v| results[k] = v }

results
# => {1=>1, 2=>4, 3=>9}
squares.inject({}) { |h, kv| h[kv[0]] = kv[1]; h }
# => {1=>1, 2=>4, 3=>9}
