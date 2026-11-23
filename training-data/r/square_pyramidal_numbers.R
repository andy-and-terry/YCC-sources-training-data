# n(n+1)(2n+1)/6
term <- function(n) ((n * (n + 1)) * ((2 * n) + 1)) %/% 6

for (n in 1:15) {
  cat(sprintf("%2d -> %d\n", n, term(n)))
}
