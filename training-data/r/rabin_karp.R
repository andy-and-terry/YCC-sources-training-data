rabin_karp <- function(text, pattern, base = 256, mod = 101) {
  n <- nchar(text)
  m <- nchar(pattern)
  if (m > n) return(c())

  text_chars <- utf8ToInt(text)
  pattern_chars <- utf8ToInt(pattern)

  h <- base^(m - 1) %% mod
  pattern_hash <- 0
  window_hash <- 0
  for (i in 1:m) {
    pattern_hash <- (base * pattern_hash + pattern_chars[i]) %% mod
    window_hash <- (base * window_hash + text_chars[i]) %% mod
  }

  matches <- c()
  for (i in 0:(n - m)) {
    if (window_hash == pattern_hash && identical(text_chars[(i + 1):(i + m)], pattern_chars)) {
      matches <- c(matches, i)
    }
    if (i < n - m) {
      window_hash <- (base * (window_hash - text_chars[i + 1] * h) + text_chars[i + m + 1]) %% mod
      window_hash <- (window_hash + mod) %% mod
    }
  }
  matches
}

print(rabin_karp("abxabcabcaby", "abcaby"))
print(rabin_karp("aaaaa", "aa"))
