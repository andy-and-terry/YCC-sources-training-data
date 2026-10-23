zeckendorf <- function(n) {
  fibs <- c(1, 2)
  while (fibs[length(fibs)] + fibs[length(fibs) - 1] <= n) {
    fibs <- c(fibs, fibs[length(fibs)] + fibs[length(fibs) - 1])
  }
  parts <- c()
  for (f in rev(fibs)) {
    if (f <= n) {
      parts <- c(parts, f)
      n <- n - f
    }
  }
  parts
}

cat(paste(as.integer(zeckendorf(100)), collapse = " "), "\n", sep = "")
