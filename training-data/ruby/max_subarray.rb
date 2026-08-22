def max_subarray(nums)
  best = current = nums.first
  nums[1..].each do |x|
    current = [x, current + x].max
    best = [best, current].max
  end
  best
end

puts max_subarray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
