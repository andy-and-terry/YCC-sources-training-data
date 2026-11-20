# Wilson's theorem primality test.
wilson <- function(n) {
  if (n < 2) return(FALSE)
  f <- 1
  for (i in seq_len(n - 2) + 1) f <- (f * i) %% n
  f == n - 1
}
print(Filter(wilson, 2:19))
