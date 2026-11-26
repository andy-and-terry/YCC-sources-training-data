# Primorials up to 1e6, including 1; expect 8.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) { if (n %% d == 0) return(FALSE); d <- d + 1 }
  TRUE
}

values <- c(1)
acc <- 1
p <- 2
repeat {
  if (is_prime(p)) {
    acc <- acc * p
    if (acc > 1e6) break
    values <- c(values, acc)
  }
  p <- p + 1
}
cat(length(values), ":", values, "\n")
