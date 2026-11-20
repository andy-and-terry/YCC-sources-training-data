# Lattice paths via the binomial coefficient and via DP.
lattice <- function(n) {
  row <- rep(1, n + 1)
  for (k in seq_len(n)) for (j in 2:(n + 1)) row[j] <- row[j] + row[j - 1]
  row[n + 1]
}
print(lattice(3)); print(choose(6, 3))
