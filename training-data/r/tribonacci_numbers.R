# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
tribonacci <- function(count) {
  t <- numeric(count)
  t[3] <- 1
  for (i in 4:count) {
    t[i] <- t[i - 1] + t[i - 2] + t[i - 3]
  }
  t
}

cat("Tribonacci:", tribonacci(15), "\n")
