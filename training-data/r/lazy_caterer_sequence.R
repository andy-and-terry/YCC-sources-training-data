# n(n+1)/2+1
term <- function(n) ((n * (n + 1)) %/% 2) + 1

for (n in 1:15) {
  cat(sprintf("%2d -> %d\n", n, term(n)))
}
