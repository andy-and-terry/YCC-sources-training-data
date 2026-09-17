lcs_length <- function(a, b) {
  m <- nchar(a)
  n <- nchar(b)
  dp <- matrix(0, nrow = m + 1, ncol = n + 1)

  for (i in seq_len(m)) {
    for (j in seq_len(n)) {
      if (substr(a, i, i) == substr(b, j, j)) {
        dp[i + 1, j + 1] <- dp[i, j] + 1
      } else {
        dp[i + 1, j + 1] <- max(dp[i, j + 1], dp[i + 1, j])
      }
    }
  }

  dp[m + 1, n + 1]
}

lcs_string <- function(a, b) {
  m <- nchar(a)
  n <- nchar(b)
  dp <- matrix(0, nrow = m + 1, ncol = n + 1)

  for (i in seq_len(m)) {
    for (j in seq_len(n)) {
      if (substr(a, i, i) == substr(b, j, j)) {
        dp[i + 1, j + 1] <- dp[i, j] + 1
      } else {
        dp[i + 1, j + 1] <- max(dp[i, j + 1], dp[i + 1, j])
      }
    }
  }

  result <- c()
  i <- m
  j <- n
  while (i > 0 && j > 0) {
    if (substr(a, i, i) == substr(b, j, j)) {
      result <- c(substr(a, i, i), result)
      i <- i - 1
      j <- j - 1
    } else if (dp[i, j + 1] >= dp[i + 1, j]) {
      i <- i - 1
    } else {
      j <- j - 1
    }
  }
  paste(result, collapse = "")
}

print(lcs_length("abcde", "ace"))
print(lcs_string("abcde", "ace"))
