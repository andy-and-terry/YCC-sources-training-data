factorial <- function(n) {
  if (n <= 1) return(1)
  n * Recall(n - 1)
}

fibonacci <- function(n) {
  if (n < 2) return(n)
  Recall(n - 1) + Recall(n - 2)
}

print(factorial(6))
print(sapply(0:10, fibonacci))
