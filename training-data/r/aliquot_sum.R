# Aliquot sum classification.
aliquot <- function(n) { d <- seq_len(n - 1); sum(d[n %% d == 0]) }
for (n in c(6, 12, 15, 28)) {
  a <- aliquot(n)
  cat(n, a, if (a == n) "perfect" else if (a > n) "abundant" else "deficient", "\n")
}
