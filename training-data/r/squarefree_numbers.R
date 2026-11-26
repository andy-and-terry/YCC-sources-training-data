# Squarefree numbers up to 100; expect 61.
squarefree <- function(n) {
  d <- 2
  while (d * d <= n) { if (n %% (d * d) == 0) return(FALSE); d <- d + 1 }
  TRUE
}
cat(sum(sapply(1:100, squarefree)), "\n")
