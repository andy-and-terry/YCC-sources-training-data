# Lazy caterer sequence: max pieces from n cuts
term <- function(n) ((n * (n + 1)) %/% 2) + 1

cat(sapply(0:9, term), "\n")
