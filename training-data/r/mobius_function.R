# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
mobius <- function(n) {
  result <- 1
  p <- 2
  while (p * p <= n) {
    if (n %% p == 0) {
      n <- n %/% p
      if (n %% p == 0) return(0)
      result <- -result
    }
    p <- p + 1
  }
  if (n > 1) -result else result
}

cat(sapply(1:30, mobius), "\n")
