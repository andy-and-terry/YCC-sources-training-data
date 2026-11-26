# Sexy primes below 100; expect 16 pairs.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) { if (n %% d == 0) return(FALSE); d <- d + 1 }
  TRUE
}

cat(sum(sapply(2:99, function(p) is_prime(p) && is_prime(p + 6))), "\n")
