counts = Hash.new(0)
"banana".each_char { |c| counts[c] += 1 }
p counts

groups = Hash.new { |h, k| h[k] = [] }
%w[apple avocado banana blueberry cherry].each { |w| groups[w[0]] << w }
p groups

# Auto-vivifying nested hash
tree = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
tree[:a][:b][:c] = 1
p tree

fib = Hash.new { |h, n| h[n] = n < 2 ? n : h[n - 1] + h[n - 2] }
puts fib[40]
