def longest_increasing_subsequence(nums : Array(Int32)) : Int32
  return 0 if nums.empty?
  dp = Array.new(nums.size, 1)
  (1...nums.size).each do |i|
    (0...i).each do |j|
      if nums[j] < nums[i] && dp[j] + 1 > dp[i]
        dp[i] = dp[j] + 1
      end
    end
  end
  dp.max
end

puts longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18])
puts longest_increasing_subsequence([0, 1, 0, 3, 2, 3])
puts longest_increasing_subsequence([7, 7, 7, 7])
