cube_from_odds <- function(n) {
  start <- n * n - n + 1
  sum(start + 2 * (0:(n - 1)))
}

for (n in 1:5) {
  cat(n, cube_from_odds(n), cube_from_odds(n) == n^3, "\n")
}
