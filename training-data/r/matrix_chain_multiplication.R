matrix_chain_order <- function(dims) {
  n <- length(dims) - 1
  dp <- matrix(0, nrow = n, ncol = n)

  for (chain_len in 2:n) {
    for (i in 1:(n - chain_len + 1)) {
      j <- i + chain_len - 1
      dp[i, j] <- Inf
      for (k in i:(j - 1)) {
        cost <- dp[i, k] + dp[k + 1, j] + dims[i] * dims[k + 1] * dims[j + 1]
        if (cost < dp[i, j]) dp[i, j] <- cost
      }
    }
  }
  dp[1, n]
}

# Matrices of dimensions 40x20, 20x30, 30x10, 10x30
dims <- c(40, 20, 30, 10, 30)
print(matrix_chain_order(dims))
