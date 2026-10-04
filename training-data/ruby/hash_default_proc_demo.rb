# Hash defaults: shared value vs per-key block, auto-vivification
# and tally/group_by for counting.
shared = Hash.new([])
shared[:a] << 1
p shared, shared[:b]   # the default array was mutated, not stored

safe = Hash.new { |h, k| h[k] = [] }
safe[:a] << 1
safe[:b] << 2
safe[:a] << 3
p safe

nested = Hash.new { |h, k| h[k] = Hash.new(0) }
nested[:x][:hits] += 1
nested[:x][:hits] += 1
p nested

fib = Hash.new { |h, n| h[n] = n < 2 ? n : h[n - 1] + h[n - 2] }
p fib[40]

words = %w[apple avocado banana blueberry cherry]
p words.group_by { |w| w[0] }
p words.map(&:length).tally
p words.to_h { |w| [w, w.size] }.select { |_, v| v > 6 }
p safe.fetch(:zzz, "none")
