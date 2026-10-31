prime_factor_count <- function(n) {
  count <- 0
  p <- 2
  while (p * p <= n) {
    while (n %% p == 0) {
      n <- n %/% p
      count <- count + 1
    }
    p <- p + 1
  }
  if (n > 1) count + 1 else count
}

print(Filter(function(n) prime_factor_count(n) == 2, 2:29))
