prime_factors <- function(n) {
  factors <- c()
  d <- 2
  while (d * d <= n) {
    while (n %% d == 0) {
      factors <- c(factors, d)
      n <- n / d
    }
    d <- d + 1
  }
  if (n > 1) factors <- c(factors, n)
  factors
}

print(prime_factors(360))
print(prime_factors(97))
print(table(prime_factors(1001 * 8)))
print(paste(prime_factors(84), collapse = " x "))
