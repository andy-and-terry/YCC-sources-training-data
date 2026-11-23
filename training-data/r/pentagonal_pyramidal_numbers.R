# n^2(n+1)/2
term <- function(n) ((n * n) * (n + 1)) %/% 2

for (n in 1:15) {
  cat(sprintf("%2d -> %d\n", n, term(n)))
}
