# P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
pell <- function(count) {
  p <- numeric(count)
  p[2] <- 1
  for (k in 3:count) p[k] <- 2 * p[k - 1] + p[k - 2]
  p
}

terms <- pell(15)
for (i in seq_along(terms)) {
  cat(sprintf("P(%d) = %d\n", i - 1, terms[i]))
}
