# Deficient numbers below 100; expect 76.
proper_sum <- function(n) {
  if (n < 2) return(0)
  d <- 1:(n - 1)
  sum(d[n %% d == 0])
}
cat(sum(sapply(1:99, function(n) proper_sum(n) < n)), "\n")
