mat_det <- function(m) {
  n <- nrow(m)
  if (n == 1) return(m[1, 1])
  if (n == 2) return(m[1, 1] * m[2, 2] - m[1, 2] * m[2, 1])
  total <- 0
  for (j in seq_len(n)) {
    minor <- m[-1, -j, drop = FALSE]
    total <- total + (-1)^(1 + j) * m[1, j] * mat_det(minor)
  }
  total
}
m <- matrix(c(2, 0, 1, 1, 3, 2, 1, 1, 1), 3, byrow = TRUE)
print(mat_det(m))
print(all.equal(mat_det(m), det(m)))
print(mat_det(diag(4)))
print(mat_det(matrix(1:9, 3)))
mat_pow <- function(m, k) if (k == 1) m else m %*% mat_pow(m, k - 1)
print(mat_pow(matrix(c(1, 1, 1, 0), 2), 10))
