# Sum of prime factors counted with multiplicity.
sopfr <- function(n) {
  total <- 0
  p <- 2
  while (p * p <= n) {
    while (n %% p == 0) {
      total <- total + p
      n <- n %/% p
    }
    p <- p + 1
  }
  if (n > 1) total <- total + n
  total
}

cat(Filter(function(n) sopfr(n) == sopfr(n + 1), 2:109), "\n")
