shoelace <- function(x, y) {
  j <- c(seq_along(x)[-1], 1)
  abs(sum(x * y[j] - x[j] * y)) / 2
}
print(shoelace(c(0, 4, 4, 0), c(0, 0, 3, 3)))
