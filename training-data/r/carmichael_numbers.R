# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
gcd <- function(a, b) if (b == 0) a else gcd(b, a %% b)

pow_mod <- function(b, e, m) {
  r <- 1
  b <- b %% m
  while (e > 0) {
    if (e %% 2 == 1) r <- (r * b) %% m
    b <- (b * b) %% m
    e <- e %/% 2
  }
  r
}

is_prime <- function(n) n > 1 && all(n %% seq_len(max(1, floor(sqrt(n))))[-1] != 0)

is_carmichael <- function(n) {
  if (is_prime(n)) return(FALSE)
  for (a in 2:(n - 1)) {
    if (gcd(a, n) == 1 && pow_mod(a, n - 1, n) != 1) return(FALSE)
  }
  TRUE
}

cat(Filter(is_carmichael, seq(3, 2999, by = 2)), "\n")
