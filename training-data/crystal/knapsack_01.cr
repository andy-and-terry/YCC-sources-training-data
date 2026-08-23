def knapsack(weights : Array(Int32), values : Array(Int32), capacity : Int32) : Int32
  n = weights.size
  dp = Array.new(n + 1) { Array.new(capacity + 1, 0) }
  (1..n).each do |i|
    (0..capacity).each do |w|
      dp[i][w] = if weights[i - 1] <= w
                    Math.max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1])
                  else
                    dp[i - 1][w]
                  end
    end
  end
  dp[n][capacity]
end

puts knapsack([1, 3, 4, 5], [1, 4, 5, 7], 7)
