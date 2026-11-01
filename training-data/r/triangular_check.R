# n is triangular iff 8n + 1 is a perfect square.
is_triangular <- function(n) {
  s <- 8 * n + 1
  r <- round(sqrt(s))
  r * r == s
}

cat(Filter(is_triangular, 0:20), "\n")
