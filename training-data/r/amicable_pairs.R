# Amicable pairs below 1500 via sums of proper divisors.
s <- function(n) {
  d <- seq_len(n - 1)
  sum(d[n %% d == 0])
}

for (a in 2:1499) {
  b <- s(a)
  if (b > a && s(b) == a) cat(a, b, "\n")
}
