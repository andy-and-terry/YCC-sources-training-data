nums = [1, 4, 9, 16, 25]

p nums.each_cons(2).to_a
p nums.each_cons(2).map { |a, b| b - a }
p nums.each_slice(2).to_a

names = %w[a b c]
p names.zip(nums, nums.map { |n| n * 2 })
p names.zip(nums).to_h
p nums.each_with_index.select { |_, i| i.even? }.map(&:first)
