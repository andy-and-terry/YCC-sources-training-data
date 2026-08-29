build_lps <- function(pattern) {
  n <- nchar(pattern)
  lps <- rep(0, n)
  len <- 0
  i <- 2
  while (i <= n) {
    if (substr(pattern, i, i) == substr(pattern, len + 1, len + 1)) {
      len <- len + 1
      lps[i] <- len
      i <- i + 1
    } else if (len != 0) {
      len <- lps[len]
    } else {
      lps[i] <- 0
      i <- i + 1
    }
  }
  lps
}

kmp_search <- function(text, pattern) {
  lps <- build_lps(pattern)
  n <- nchar(text)
  m <- nchar(pattern)
  i <- 1
  j <- 1
  while (i <= n) {
    if (substr(text, i, i) == substr(pattern, j, j)) {
      i <- i + 1
      j <- j + 1
      if (j > m) return(i - j)
    } else if (j > 1) {
      j <- lps[j - 1]
    } else {
      i <- i + 1
    }
  }
  -1
}

print(kmp_search("abxabcabcaby", "abcaby"))
