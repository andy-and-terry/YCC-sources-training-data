# Pronic numbers n(n+1)
term <- function(n) n * (n + 1)

cat(sapply(0:9, term), "\n")
