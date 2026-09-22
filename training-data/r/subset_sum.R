subset_sum <- function(nums, target) {
  n <- length(nums)
  dp <- matrix(FALSE, nrow = n + 1, ncol = target + 1)
  dp[, 1] <- TRUE

  for (i in 1:n) {
    for (t in 1:target) {
      dp[i + 1, t + 1] <- dp[i, t + 1]
      if (nums[i] <= t && dp[i, t - nums[i] + 1]) {
        dp[i + 1, t + 1] <- TRUE
      }
    }
  }
  dp[n + 1, target + 1]
}

print(subset_sum(c(3, 34, 4, 12, 5, 2), 9))
print(subset_sum(c(3, 34, 4, 12, 5, 2), 30))
