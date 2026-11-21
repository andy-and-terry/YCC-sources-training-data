# Disarium numbers: digits raised to their 1-based positions sum to n.
is_disarium <- function(n) {
  d <- as.integer(strsplit(as.character(n), "")[[1]])
  sum(d^seq_along(d)) == n
}

cat(Filter(is_disarium, 1:999), "\n")
