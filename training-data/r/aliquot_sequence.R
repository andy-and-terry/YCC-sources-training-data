# Aliquot sequence: replace n by the sum of its proper divisors.
aliquot_sum <- function(n) {
  d <- seq_len(n %/% 2)
  sum(d[n %% d == 0])
}

seq_vals <- 12
while (tail(seq_vals, 1) > 1 && length(seq_vals) < 20) {
  seq_vals <- c(seq_vals, aliquot_sum(tail(seq_vals, 1)))
}
cat(seq_vals, "\n")
