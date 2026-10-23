def lucky(limit)
  nums = (1...limit).step(2).to_a
  i = 1
  while i < nums.size && nums[i] <= nums.size
    step = nums[i]
    nums = nums.each_with_index.reject { |_, idx| (idx + 1) % step == 0 }.map(&:first)
    i += 1
  end
  nums
end

puts lucky(100).join(" ")
