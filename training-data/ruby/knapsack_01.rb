def knapsack(weights, values, capacity)
  n = weights.length
  dp = Array.new(n + 1) { Array.new(capacity + 1, 0) }
  (1..n).each do |i|
    (0..capacity).each do |w|
      dp[i][w] = dp[i - 1][w]
      if weights[i - 1] <= w
        dp[i][w] = [dp[i][w], dp[i - 1][w - weights[i - 1]] + values[i - 1]].max
      end
    end
  end
  dp[n][capacity]
end

puts knapsack([1, 3, 4, 5], [1, 4, 5, 7], 7)
