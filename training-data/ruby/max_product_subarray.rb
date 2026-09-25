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

[[2, 3, -2, 4], [-2, 0, -1], [-2, 3, -4], [1, -2, -3, 0, 7, -8, -2]].each { |a| puts "#{a.inspect} -> #{max_product(a)}" }
