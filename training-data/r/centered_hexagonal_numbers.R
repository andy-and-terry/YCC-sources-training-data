# 3n(n-1)+1
term <- function(n) ((3 * n) * (n - 1)) + 1

for (n in 1:15) {
  cat(sprintf("%2d -> %d\n", n, term(n)))
}
