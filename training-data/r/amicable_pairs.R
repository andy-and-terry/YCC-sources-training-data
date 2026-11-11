# Amicable pairs: d(a) == b and d(b) == a with a != b.
d <- function(n) {
  i <- seq_len(n - 1)
  sum(i[n %% i == 0])
}

for (a in 2:1499) {
  b <- d(a)
  if (b > a && d(b) == a) cat(a, b, "\n")
}
