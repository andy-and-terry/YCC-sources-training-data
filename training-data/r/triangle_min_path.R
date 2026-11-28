minimum_total <- function(tri) {
  dp <- tri[[length(tri)]]
  for (r in (length(tri) - 1):1) {
    row <- tri[[r]]
    dp <- row + pmin(dp[-length(dp)], dp[-1])
  }
  dp[1]
}

print(minimum_total(list(2, c(3, 4), c(6, 5, 7), c(4, 1, 8, 3)))) # 11
