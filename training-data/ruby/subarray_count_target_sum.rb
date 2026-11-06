# Count contiguous subarrays whose sum equals k (prefix sums + Hash).
def count_subarrays(nums, k)
  seen = Hash.new(0)
  seen[0] = 1
  total = count = 0
  nums.each do |x|
    total += x
    count += seen[total - k]
    seen[total] += 1
  end
  count
end

puts count_subarrays([1, 1, 1], 2)
