collatz_steps <- function(n) {
  steps <- 0
  repeat {
    if (n == 1) break
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
    steps <- steps + 1
  }
  steps
}

print(collatz_steps(27))

find_first_multiple <- function(values, divisor) {
  i <- 0
  repeat {
    i <- i + 1
    if (i > length(values)) return(NA)
    if (values[i] %% divisor != 0) next
    return(values[i])
  }
}

print(find_first_multiple(c(1, 3, 7, 8, 10), 4))
print(find_first_multiple(c(1, 3, 7), 4))
