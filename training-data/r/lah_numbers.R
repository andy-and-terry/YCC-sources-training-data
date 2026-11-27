lah <- function(n, k) choose(n - 1, k - 1) * factorial(n) / factorial(k)

for (n in 1:5) {
  cat(sapply(1:n, function(k) lah(n, k)), "\n")
}
