tree = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
tree[:a][:b][:c] = 1
puts tree.inspect
counts = Hash.new(0)
"mississippi".each_char { |c| counts[c] += 1 }
puts counts.sort_by { |k, v| [-v, k] }.to_h
puts counts.transform_values { |v| v * 2 }.select { |_, v| v > 4 }.keys.inspect
puts({a: 1}.merge({a: 2, b: 3}) { |_, x, y| x + y })
