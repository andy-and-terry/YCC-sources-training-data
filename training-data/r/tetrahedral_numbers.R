# n(n+1)(n+2)/6
term <- function(n) ((n * (n + 1)) * (n + 2)) %/% 6

for (n in 1:15) {
  cat(sprintf("%2d -> %d\n", n, term(n)))
}
