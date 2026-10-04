# Hash with a default block: missing keys are computed (and stored) on demand.
counts = Hash(String, Int32).new(0)
%w[a b a c a b].each { |w| counts[w] += 1 }
puts counts

groups = Hash(Int32, Array(String)).new { |h, k| h[k] = [] of String }
%w[apple fig kiwi plum banana].each { |w| groups[w.size] << w }
puts groups

fib = Hash(Int32, Int64).new do |h, n|
  h[n] = n < 2 ? n.to_i64 : h[n - 1] + h[n - 2]
end
puts fib[50]
