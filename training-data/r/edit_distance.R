edit_distance <- function(a, b) {
  m <- nchar(a)
  n <- nchar(b)
  table_dp <- matrix(0, nrow = m + 1, ncol = n + 1)
  for (i in 0:m) table_dp[i + 1, 1] <- i
  for (j in 0:n) table_dp[1, j + 1] <- j
  for (i in 1:m) {
    for (j in 1:n) {
      cost <- if (substr(a, i, i) == substr(b, j, j)) 0 else 1
      table_dp[i + 1, j + 1] <- min(
        table_dp[i, j + 1] + 1,
        table_dp[i + 1, j] + 1,
        table_dp[i, j] + cost
      )
    }
  }
  table_dp[m + 1, n + 1]
}

print(edit_distance("kitten", "sitting"))
