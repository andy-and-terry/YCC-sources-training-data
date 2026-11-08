secant <- function(f, a, b, tol = 1e-12) {
  for (i in 1:50) {
    c <- b - f(b) * (b - a) / (f(b) - f(a))
    if (abs(c - b) < tol) return(c)
    a <- b
    b <- c
  }
  b
}
cat(sprintf("%.8f\n", secant(function(x) x^2 - 2, 1, 2)))
