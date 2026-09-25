def can_partition?(nums)
  total = nums.sum
  return false if total.odd?

  reach = nums.reduce(1) { |bits, x| bits | (bits << x) }
  reach[total / 2] == 1
end

def partition(nums)
  return nil unless can_partition?(nums)

  target = nums.sum / 2
  (1..nums.size).each do |k|
    nums.each_index.to_a.combination(k) do |idx|
      next unless idx.sum { |i| nums[i] } == target

      return [idx.map { |i| nums[i] }, nums.each_index.reject { |i| idx.include?(i) }.map { |i| nums[i] }]
    end
  end
end

p can_partition?([1, 5, 11, 5]), can_partition?([1, 2, 3, 5])
p partition([3, 1, 1, 2, 2, 1])
