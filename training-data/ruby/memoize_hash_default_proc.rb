fib = Hash.new { |h, n| h[n] = n < 2 ? n : h[n - 1] + h[n - 2] }
puts fib[40]
puts fib.size

# Autovivifying nested hash
tree = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
tree[:a][:b][:c] = 1
tree[:a][:d] = 2
p tree

counts = Hash.new(0)
"hello world".each_char { |c| counts[c] += 1 unless c == " " }
p counts.sort_by { |c, n| [-n, c] }.first(3)
