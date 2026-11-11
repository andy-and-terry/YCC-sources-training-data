# Centered square numbers 2n(n+1)+1
term <- function(n) ((2 * n) * (n + 1)) + 1

cat(sapply(0:9, term), "\n")
