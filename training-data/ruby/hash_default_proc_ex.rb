tree = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
tree[:a][:b][:c] = 1
tree[:a][:d] = 2
p tree

counts = Hash.new(0)
"mississippi".each_char { |c| counts[c] += 1 }
p counts
