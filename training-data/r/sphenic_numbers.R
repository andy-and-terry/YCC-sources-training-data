is_sphenic <- function(n) {
  distinct <- 0
  p <- 2
  while (p * p <= n) {
    if (n %% p == 0) {
      n <- n %/% p
      if (n %% p == 0) return(FALSE)
      distinct <- distinct + 1
    }
    p <- p + 1
  }
  if (n > 1) distinct <- distinct + 1
  distinct == 3
}

print(Filter(is_sphenic, 2:79))
