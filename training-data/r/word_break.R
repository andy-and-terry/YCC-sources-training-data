word_break <- function(s, word_dict) {
  n <- nchar(s)
  dp <- logical(n + 1)
  dp[1] <- TRUE  # dp[i+1] means s[1..i] is segmentable (1-indexed offset)

  for (i in seq_len(n)) {
    for (j in 0:(i - 1)) {
      if (dp[j + 1] && substr(s, j + 1, i) %in% word_dict) {
        dp[i + 1] <- TRUE
        break
      }
    }
  }

  dp[n + 1]
}

dictionary <- c("leet", "code", "sand", "and", "cats", "dog")
print(word_break("leetcode", dictionary))
print(word_break("catsandog", dictionary))
