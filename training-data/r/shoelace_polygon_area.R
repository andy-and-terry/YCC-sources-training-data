# Shoelace polygon area (vectorised).
area <- function(x, y) {
  x2 <- c(x[-1], x[1]); y2 <- c(y[-1], y[1])
  abs(sum(x * y2 - x2 * y)) / 2
}
print(area(c(0, 4, 4, 0), c(0, 0, 3, 3)))
