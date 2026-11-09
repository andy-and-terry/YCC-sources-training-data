counts = Hash(String, Int32).new(0)
%w[a b a c a].each { |w| counts[w] += 1 }
puts counts
groups = Hash(Int32, Array(String)).new { |h, k| h[k] = [] of String }
%w[one two three four].each { |w| groups[w.size] << w }
puts groups
