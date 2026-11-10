is_prime <- function(n) {
  if (n < 2) return(FALSE)
  if (n < 4) return(TRUE)
  all(n %% 2:floor(sqrt(n)) != 0)
}

for (p in 3:78) {
  if (is_prime(p) && is_prime(p + 2)) cat(sprintf("(%d,%d) ", p, p + 2))
}
cat("\n") # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
