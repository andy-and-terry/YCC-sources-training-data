is_toeplitz <- function(m) {
  if (nrow(m) < 2 || ncol(m) < 2) return(TRUE)
  all(m[-1, -1] == m[-nrow(m), -ncol(m)])
}

print(is_toeplitz(matrix(c(1, 4, 5, 2, 1, 4, 3, 2, 1), 3)))
print(is_toeplitz(matrix(c(1, 2, 2, 2), 2)))
