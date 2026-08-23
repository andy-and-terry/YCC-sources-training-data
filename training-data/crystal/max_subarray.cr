def max_subarray(nums : Array(Int32)) : Int32
  max_so_far = nums[0]
  max_ending_here = nums[0]
  (1...nums.size).each do |i|
    max_ending_here = Math.max(nums[i], max_ending_here + nums[i])
    max_so_far = Math.max(max_so_far, max_ending_here)
  end
  max_so_far
end

puts max_subarray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
