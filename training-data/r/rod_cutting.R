rod_cutting <- function(prices, length) {
  best <- rep(0, length + 1)
  for (n in 1:length) {
    best[n + 1] <- max(sapply(1:n, function(i) prices[i] + best[n - i + 1]))
  }
  best[length + 1]
}

prices <- c(1, 5, 8, 9, 10, 17, 17, 20)
print(rod_cutting(prices, 8))
print(rod_cutting(prices, 4))
