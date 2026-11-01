# Pernicious numbers: the popcount is prime.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) {
    if (n %% d == 0) return(FALSE)
    d <- d + 1
  }
  TRUE
}

popcount <- function(n) sum(as.integer(intToBits(n)))

cat(Filter(function(n) is_prime(popcount(n)), 1:20), "\n")
