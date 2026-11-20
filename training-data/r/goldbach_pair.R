# Goldbach pair.
is_prime <- function(n) n > 1 && all(n %% seq_len(max(1, floor(sqrt(n))))[-1] != 0)
goldbach <- function(n) {
  for (p in 2:(n %/% 2)) if (is_prime(p) && is_prime(n - p)) return(c(p, n - p))
}
print(goldbach(28))
