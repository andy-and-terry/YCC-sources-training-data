# Enumerable windowing helpers: each_slice, each_cons, zip, with_index.
nums = (1..10).to_a

nums.each_slice(3) { |s| puts "slice: #{s}" }
nums.each_cons(4).first(2).each { |w| puts "window: #{w}" }

diffs = nums.each_cons(2).map { |(a, b)| b - a }
puts "diffs: #{diffs.uniq}"

names = %w[x y z]
names.each_with_index(1) { |n, i| puts "#{i}. #{n}" }
puts names.zip(nums.first(3)).to_h
