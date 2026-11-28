secant <- function(f, x0, x1, tol = 1e-12, limit = 50) {
  for (i in seq_len(limit)) {
    f0 <- f(x0)
    f1 <- f(x1)
    if (f1 == f0) break
    nxt <- x1 - f1 * (x1 - x0) / (f1 - f0)
    x0 <- x1
    x1 <- nxt
    if (abs(x1 - x0) < tol) break
  }
  x1
}

cat(sprintf("%.10f\n", secant(function(x) x^2 - 2, 1, 2)))
