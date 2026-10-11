letters = "mississippi".chars

puts letters.tally
puts letters.tally.to_a.sort_by { |_, n| -n }.first
puts letters.group_by(&.itself).transform_values(&.size)

nums = (1..10).to_a
puts nums.group_by(&.%(3))
puts nums.partition(&.even?)
puts nums.chunk_while { |a, b| b == a + 1 }.to_a.size
puts [1, 2, 4, 5, 7].chunk_while { |a, b| b == a + 1 }.to_a.inspect
puts nums.sum(&.to_f) / nums.size
