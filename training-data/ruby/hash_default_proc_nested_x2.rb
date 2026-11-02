h = Hash.new { |hash, k| hash[k] = Hash.new(0) }
h[:a][:x] += 1
h[:a][:y] += 2
p h
