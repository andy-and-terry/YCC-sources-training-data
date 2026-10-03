def subarray_sum_count(nums, k)
  counts = Hash.new(0)
  counts[0] = 1
  running_sum = 0
  total = 0

  nums.each do |num|
    running_sum += num
    total += counts[running_sum - k]
    counts[running_sum] += 1
  end
  total
end

puts subarray_sum_count([1, 1, 1], 2)
puts subarray_sum_count([1, 2, 3], 3)
puts subarray_sum_count([-1, -1, 1], 0)
