is_prime <- function(n) {
  if (n < 2) return(FALSE)
  if (n < 4) return(TRUE)
  all(n %% 2:floor(sqrt(n)) != 0)
}

found <- c(); p <- 2
while (length(found) < 10) {
  if (is_prime(p) && is_prime(2 * p + 1)) found <- c(found, p)
  p <- p + 1
}
cat(found, "\n") # 2 3 5 11 23 29 41 53 83 89
