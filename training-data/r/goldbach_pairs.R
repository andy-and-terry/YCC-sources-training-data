is_prime <- function(n) n > 1 && all(n %% seq_len(max(1, floor(sqrt(n))))[-1] != 0)

goldbach <- function(n) {
  ps <- Filter(function(p) is_prime(p) && is_prime(n - p), 2:(n %/% 2))
  cbind(ps, n - ps)
}

print(goldbach(28))
