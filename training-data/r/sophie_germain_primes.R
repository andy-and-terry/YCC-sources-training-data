# Sophie Germain primes: p prime and 2p + 1 prime.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) {
    if (n %% d == 0) return(FALSE)
    d <- d + 1
  }
  TRUE
}
cat(Filter(function(p) is_prime(p) && is_prime(2 * p + 1), 2:99), "\n")
