lcs_length <- function(a, b) {
  m <- nchar(a)
  n <- nchar(b)
  dp <- matrix(0, nrow = m + 1, ncol = n + 1)
  a_chars <- strsplit(a, "")[[1]]
  b_chars <- strsplit(b, "")[[1]]

  for (i in seq_len(m)) {
    for (j in seq_len(n)) {
      if (a_chars[i] == b_chars[j]) {
        dp[i + 1, j + 1] <- dp[i, j] + 1
      } else {
        dp[i + 1, j + 1] <- max(dp[i, j + 1], dp[i + 1, j])
      }
    }
  }
  dp[m + 1, n + 1]
}

print(lcs_length("ABCBDAB", "BDCABA"))
print(lcs_length("abc", "abc"))
