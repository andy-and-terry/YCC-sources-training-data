# Goldbach partitions of 100; expect 6.
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  d <- 2
  while (d * d <= n) { if (n %% d == 0) return(FALSE); d <- d + 1 }
  TRUE
}

ps <- Filter(function(p) is_prime(p) && is_prime(100 - p), 2:50)
cat(length(ps), ":", paste0(ps, "+", 100 - ps), "\n")
