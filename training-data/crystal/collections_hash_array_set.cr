a = [5, 3, 8, 1, 9, 2]
puts a.sort.inspect, a.select(&.even?).inspect, a.reject(&.even?).inspect, a.map { |x| x * x }.sum
puts a.each_slice(2).to_a.inspect, a.each_cons(3).map(&.sum).to_a.inspect, a.partition { |x| x > 4 }.inspect
puts a.group_by { |x| x % 3 }.inspect, a.min, a.max, a.minmax.inspect, a.sum, a.reduce(1) { |m, x| m * x }
puts a.zip(a.rotate).first(2).inspect, a.sort_by { |x| -x }.first(3).inspect, a.index(8), a.includes?(9)
puts a.each_with_index.map { |x, i| x * i }.to_a.inspect, a.take_while { |x| x != 1 }.inspect
h = {"a" => 1, "b" => 2}
h["c"] = 3
puts h.fetch("z", 0), h.has_key?("a"), h.keys.inspect, h.values.sum, h.map { |k, v| "#{k}#{v}" }.join
puts h.select { |_, v| v > 1 }.inspect, h.transform_values { |v| v * 10 }.inspect, h.min_by { |_, v| v }.inspect
counts = Hash(Char, Int32).new(0)
"mississippi".each_char { |c| counts[c] += 1 }
puts counts.to_a.sort_by { |_, n| -n }.first(2).inspect
require "set"
s = Set{1, 2, 3}
puts (s | Set{3, 4}).inspect, (s & Set{2, 3, 9}).inspect, s.subset_of?(Set{1, 2, 3, 4})
t = {name: "Ada", age: 36}
puts t[:name], t.keys, typeof(t)
