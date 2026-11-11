# Tetrahedral numbers n(n+1)(n+2)/6
term <- function(n) ((n * (n + 1)) * (n + 2)) %/% 6

cat(sapply(0:9, term), "\n")
