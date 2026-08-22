fibonacci <- function(n) {
  result <- numeric(n)
  a <- 0
  b <- 1
  for (i in 1:n) {
    result[i] <- a
    temp <- a + b
    a <- b
    b <- temp
  }
  result
}

print(fibonacci(11))
