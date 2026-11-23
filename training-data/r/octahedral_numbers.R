# n(2n^2+1)/3
term <- function(n) (n * (((2 * n) * n) + 1)) %/% 3

for (n in 1:15) {
  cat(sprintf("%2d -> %d\n", n, term(n)))
}
