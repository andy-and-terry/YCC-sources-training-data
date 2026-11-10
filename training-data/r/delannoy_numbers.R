central_delannoy <- function(n) {
  g <- matrix(1, n + 1, n + 1)
  if (n >= 1) for (i in 2:(n + 1)) for (j in 2:(n + 1)) {
    g[i, j] <- g[i - 1, j] + g[i, j - 1] + g[i - 1, j - 1]
  }
  g[n + 1, n + 1]
}
cat(sapply(0:5, central_delannoy), "\n") # 1 3 13 63 321 1683
