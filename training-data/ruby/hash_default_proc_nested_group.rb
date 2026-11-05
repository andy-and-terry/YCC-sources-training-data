h = Hash.new { |hash, k| hash[k] = Hash.new(0) }
[["a", :x], ["a", :y], ["b", :x], ["a", :x]].each { |k, t| h[k][t] += 1 }
p h
p h.transform_values { |v| v.values.sum }
p h.sum { |_, v| v.size }
