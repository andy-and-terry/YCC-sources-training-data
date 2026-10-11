nums = [1, 2, 3, 4, 5]

puts nums.reduce { |a, b| a + b }
puts nums.reduce(10) { |acc, x| acc + x }
puts nums.sum
puts nums.reduce(1) { |acc, x| acc * x }
puts nums.inject { |a, b| a > b ? a : b }

longest = %w(a abc ab).reduce("") { |best, w| w.size > best.size ? w : best }
puts longest

puts (1..5).reduce(:+)
puts nums.map(&.to_s).reduce { |a, b| "#{a}-#{b}" }
puts [[1, 2], [3]].reduce([] of Int32) { |acc, x| acc + x }.inspect
