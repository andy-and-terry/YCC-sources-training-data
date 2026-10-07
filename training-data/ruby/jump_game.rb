def can_jump?(nums)
  reach = 0
  nums.each_with_index do |n, i|
    return false if i > reach

    reach = [reach, i + n].max
  end
  true
end

def min_jumps(nums)
  jumps = finish = far = 0
  (0...nums.size - 1).each do |i|
    far = [far, i + nums[i]].max
    next unless i == finish
    return nil if far <= i

    jumps += 1
    finish = far
  end
  jumps
end

p [can_jump?([2, 3, 1, 1, 4]), can_jump?([3, 2, 1, 0, 4])]
p [min_jumps([2, 3, 1, 1, 4]), min_jumps([3, 2, 1, 0, 4])]
