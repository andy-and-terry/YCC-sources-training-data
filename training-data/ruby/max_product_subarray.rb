def max_product(nums)
  best = hi = lo = nums.first
  nums.drop(1).each do |x|
    hi, lo = lo, hi if x.negative?
    hi = [x, hi * x].max
    lo = [x, lo * x].min
    best = [best, hi].max
  end
  best
end

puts max_product([2, 3, -2, 4]), max_product([-2, 0, -1]), max_product([-2, 3, -4])
