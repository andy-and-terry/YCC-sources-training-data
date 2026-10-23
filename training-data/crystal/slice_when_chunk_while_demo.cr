data = [1, 2, 4, 9, 10, 11, 12, 15]

runs = data.chunk_while { |a, b| b == a + 1 }.to_a
puts runs.inspect

breaks = data.slice_when { |a, b| b != a + 1 }.to_a
puts breaks.inspect

puts runs.map(&.size).inspect
