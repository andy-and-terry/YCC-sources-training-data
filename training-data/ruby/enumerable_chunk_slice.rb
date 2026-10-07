nums = [1, 2, 4, 9, 10, 11, 12, 15, 16, 19, 20, 21]

p nums.slice_when { |a, b| b != a + 1 }.to_a
p nums.chunk_while { |a, b| b == a + 1 }.map(&:size)
p nums.chunk(&:even?).map { |even, xs| [even, xs.size] }
p (1..10).each_slice(3).to_a
p (1..5).each_cons(2).to_a
p %w[a b c d].each_with_index.partition { |_, i| i.even? }
p nums.group_by { |n| n % 3 }.transform_values(&:count)
p nums.map(&:odd?).tally
