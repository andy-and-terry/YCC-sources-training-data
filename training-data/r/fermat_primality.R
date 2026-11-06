# Fermat primality test; Carmichael number 561 fools it.
powmod <- function(b, e, m) {
  r <- 1
  b <- b %% m
  while (e > 0) {
    if (e %% 2 == 1) r <- (r * b) %% m
    b <- (b * b) %% m
    e <- e %/% 2
  }
  r
}

probably_prime <- function(n) n > 2 && powmod(2, n - 1, n) == 1

for (n in c(97, 91, 561)) cat(n, probably_prime(n), "\n")
