collatz <- function(n) {
  steps <- n
  while (n != 1) {
    n <- if (n %% 2 == 0) n / 2 else 3 * n + 1
    steps <- c(steps, n)
  }
  steps
}

print(collatz(6))
print(length(collatz(27)) - 1)

lens <- sapply(1:30, function(k) length(collatz(k)))
print(which.max(lens))
