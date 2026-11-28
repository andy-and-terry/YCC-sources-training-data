gcd <- function(a, b) if (b == 0) a else gcd(b, a %% b)

rho <- function(n) {
  if (n %% 2 == 0) return(2)
  f <- function(v) (v * v + 1) %% n
  x <- 2; y <- 2; d <- 1
  while (d == 1) {
    x <- f(x); y <- f(f(y))
    d <- gcd(abs(x - y), n)
  }
  d
}

n <- 8051
p <- rho(n)
cat(n, "=", p, "*", n / p, "\n")
