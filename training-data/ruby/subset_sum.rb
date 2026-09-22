def subset_sum?(numbers, target)
  n = numbers.length
  dp = Array.new(n + 1) { Array.new(target + 1, false) }
  (0..n).each { |i| dp[i][0] = true }

  (1..n).each do |i|
    (1..target).each do |t|
      dp[i][t] = dp[i - 1][t]
      dp[i][t] ||= dp[i - 1][t - numbers[i - 1]] if numbers[i - 1] <= t
    end
  end
  dp[n][target]
end

puts subset_sum?([3, 34, 4, 12, 5, 2], 9)
puts subset_sum?([3, 34, 4, 12, 5, 2], 10)
puts subset_sum?([1, 2, 3], 7)
