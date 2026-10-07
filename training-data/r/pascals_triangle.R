pascals_triangle <- function(rows) {
  triangle <- list()
  for (i in 1:rows) {
    row <- rep(1, i)
    if (i > 2) {
      prev <- triangle[[i - 1]]
      for (j in 2:(i - 1)) {
        row[j] <- prev[j - 1] + prev[j]
      }
    }
    triangle[[i]] <- row
  }
  triangle
}

result <- pascals_triangle(6)
for (row in result) {
  print(row)
}
