def rotate(nums, k)
  k %= nums.length
  nums[-k..] + nums[0...-k]
end

puts rotate([1, 2, 3, 4, 5, 6, 7], 3).inspect
