nums = (1..10).to_a
p nums.select(&:even?).map { |x| x * x }
p nums.each_slice(3).to_a
p nums.partition(&:odd?)
p nums.each_cons(2).first(3)
p nums.inject(:+), nums.minmax
