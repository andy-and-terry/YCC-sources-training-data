factorial <- function(n) {
  result <- 1
  for (i in 1:n) {
    result <- result * i
  }
  result
}

print(factorial(10))
