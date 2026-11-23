# n(n+1)(n+2)(n+3)/24
term <- function(n) (((n * (n + 1)) * (n + 2)) * (n + 3)) %/% 24

for (n in 1:15) {
  cat(sprintf("%2d -> %d\n", n, term(n)))
}
