is_powerful <- function(n) {
  p <- 2
  while (p * p <= n) {
    if (n %% p == 0) {
      if (n %% (p * p) != 0) return(FALSE)
      while (n %% p == 0) n <- n %/% p
    }
    p <- p + 1
  }
  n == 1
}

print(Filter(is_powerful, 1:100))
