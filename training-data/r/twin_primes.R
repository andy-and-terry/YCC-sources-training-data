# Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) {
    if (n %% d == 0) return(FALSE)
    d <- d + 1
  }
  TRUE
}
cat(Filter(function(p) is_prime(p) && is_prime(p + 2), 2:99), "\n")
