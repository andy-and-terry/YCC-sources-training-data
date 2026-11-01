# Positive n expressible as a*a + b*b with a, b >= 0.
representable <- function(n) {
  a <- 0
  while (a * a <= n) {
    b <- round(sqrt(n - a * a))
    if (a * a + b * b == n) return(TRUE)
    a <- a + 1
  }
  FALSE
}

cat(Filter(representable, 1:30), "\n")
