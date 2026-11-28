def equilibrium_index(nums)
  total = nums.sum
  left = 0
  nums.each_with_index do |v, i|
    return i if left == total - left - v
    left += v
  end
  -1
end

puts equilibrium_index([1, 7, 3, 6, 5, 6]) # 3
puts equilibrium_index([1, 2, 3])          # -1
