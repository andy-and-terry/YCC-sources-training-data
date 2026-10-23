words = %w[pear fig banana kiwi]

puts words.min_by(&.size)
puts words.max_by(&.size)

lo, hi = words.minmax_by(&.size)
puts "shortest=#{lo} longest=#{hi}"

nums = [4, -9, 2, 7]
puts nums.min_by { |n| n.abs }
puts nums.minmax
