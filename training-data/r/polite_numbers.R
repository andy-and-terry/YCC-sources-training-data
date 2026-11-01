# Ways to write n as a sum of two or more consecutive positive integers.
polite_ways <- function(n) {
  ways <- 0
  k <- 2
  while (k * (k + 1) / 2 <= n) {
    if ((n - k * (k - 1) / 2) %% k == 0) ways <- ways + 1
    k <- k + 1
  }
  ways
}

cat(sapply(1:16, polite_ways), "\n")
