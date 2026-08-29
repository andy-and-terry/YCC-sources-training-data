is_safe <- function(queens, col) {
  n <- length(queens)
  for (i in seq_len(n)) {
    dist <- n - i + 1
    if (queens[i] == col || abs(queens[i] - col) == dist) return(FALSE)
  }
  TRUE
}

solve_queens <- function(queens, n) {
  if (length(queens) == n) return(1)
  count <- 0
  for (col in 0:(n - 1)) {
    if (is_safe(queens, col)) {
      count <- count + solve_queens(c(queens, col), n)
    }
  }
  count
}

print(solve_queens(c(), 6))
