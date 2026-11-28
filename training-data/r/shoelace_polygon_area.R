area <- function(x, y) {
  n <- length(x)
  nxt <- c(2:n, 1)
  abs(sum(x * y[nxt] - x[nxt] * y)) / 2
}

cat(area(c(0, 4, 4, 0), c(0, 0, 3, 3)), "\n")
