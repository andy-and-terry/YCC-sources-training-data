knapsack <- function(weights, values, capacity) {
  dp <- rep(0, capacity + 1)
  for (i in 1:length(weights)) {
    for (cap in capacity:weights[i]) {
      dp[cap + 1] <- max(dp[cap + 1], dp[cap - weights[i] + 1] + values[i])
    }
  }
  dp[capacity + 1]
}

print(knapsack(c(2, 3, 4, 5), c(3, 4, 5, 6), 5))
