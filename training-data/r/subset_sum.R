subset_sum_exists <- function(nums, target) {
  n <- length(nums)
  dp <- matrix(FALSE, nrow = n + 1, ncol = target + 1)
  dp[, 1] <- TRUE

  for (i in 2:(n + 1)) {
    for (t in 1:(target + 1)) {
      value <- nums[i - 1]
      dp[i, t] <- dp[i - 1, t]
      if (!dp[i, t] && value <= (t - 1)) {
        dp[i, t] <- dp[i - 1, t - value]
      }
    }
  }
  dp[n + 1, target + 1]
}

print(subset_sum_exists(c(3, 34, 4, 12, 5, 2), 9))
print(subset_sum_exists(c(3, 34, 4, 12, 5, 2), 30))
