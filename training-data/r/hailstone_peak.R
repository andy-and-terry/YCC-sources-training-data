# Highest value reached by the Collatz (hailstone) sequence from n.
peak <- function(n) {
  best <- n
  while (n != 1) {
    n <- if (n %% 2 == 0) n / 2 else 3 * n + 1
    best <- max(best, n)
  }
  best
}

print(peak(27))
