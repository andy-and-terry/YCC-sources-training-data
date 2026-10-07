# Enumerable helpers for windows and runs.
nums = (1..10).to_a
p nums.each_slice(3).to_a
p nums.each_cons(4).first(2)
p nums.each_cons(2).map { |a, b| b - a }.uniq

p [1, 2, 4, 9, 10, 11, 12, 15].slice_when { |a, b| b != a + 1 }.to_a
p [1, 2, 4, 9, 10, 11].chunk_while { |a, b| b == a + 1 }.map { |r| r.size > 1 ? "#{r.first}-#{r.last}" : r.first.to_s }

p %w[a b c].zip([1, 2, 3], [true, false, true])
p nums.partition(&:even?)
p nums.min_by(2) { |n| (n - 5).abs }
p nums.sum { |n| n * n }
p nums.each_with_index.select { |n, i| i.even? }.map(&:first)
p nums.inject(:*)
p nums.take_while { |n| n < 4 }
