longest_increasing_subsequence <- function(nums) {
  n <- length(nums)
  if (n == 0) return(0)

  dp <- rep(1, n)
  for (i in 2:n) {
    for (j in 1:(i - 1)) {
      if (nums[j] < nums[i] && dp[j] + 1 > dp[i]) {
        dp[i] <- dp[j] + 1
      }
    }
  }
  max(dp)
}

print(longest_increasing_subsequence(c(10, 9, 2, 5, 3, 7, 101, 18)))
print(longest_increasing_subsequence(c(0, 1, 0, 3, 2, 3)))
