count_primes_below <- function(n) {
  if (n < 3) return(0L)
  composite <- logical(n)
  for (i in 2:(n - 1)) {
    if (composite[i]) next
    if (i * i < n) composite[seq(i * i, n - 1, by = i)] <- TRUE
  }
  sum(!composite[2:(n - 1)])
}

print(count_primes_below(100))
