# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
is_keith <- function(n) {
  seq <- as.integer(strsplit(as.character(n), "")[[1]])
  k <- length(seq)
  while (tail(seq, 1) < n) {
    seq <- c(seq, sum(tail(seq, k)))
  }
  tail(seq, 1) == n
}

cat(Filter(is_keith, 10:1199), "\n")
