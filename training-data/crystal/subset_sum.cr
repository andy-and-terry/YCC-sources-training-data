def subset_sum?(nums : Array(Int32), target : Int32) : Bool
  n = nums.size
  dp = Array.new(n + 1) { Array.new(target + 1, false) }
  (0..n).each { |i| dp[i][0] = true }

  (1..n).each do |i|
    (1..target).each do |t|
      dp[i][t] = dp[i - 1][t]
      dp[i][t] ||= dp[i - 1][t - nums[i - 1]] if nums[i - 1] <= t
    end
  end

  dp[n][target]
end

nums = [3, 34, 4, 12, 5, 2]
puts subset_sum?(nums, 9) # true: 4 + 5
puts subset_sum?(nums, 1) # false: no element equals 1
