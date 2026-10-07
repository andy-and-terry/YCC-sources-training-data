A <- matrix(c(2, 1, -1,
              -3, -1, 2,
              -2, 1, 2), nrow = 3, byrow = TRUE)
b <- c(8, -11, -3)

x <- solve(A, b)
print(round(x, 6))

print(round(A %*% x, 6))

A_inv <- solve(A)
print(round(A_inv, 4))
print(round(A %*% A_inv, 6))

print(det(A))

gauss_eliminate <- function(A, b) {
  n <- nrow(A)
  M <- cbind(A, b)
  for (i in seq_len(n)) {
    pivot <- which.max(abs(M[i:n, i])) + i - 1
    if (pivot != i) M[c(i, pivot), ] <- M[c(pivot, i), ]
    M[i, ] <- M[i, ] / M[i, i]
    for (j in seq_len(n)[-i]) {
      M[j, ] <- M[j, ] - M[j, i] * M[i, ]
    }
  }
  M[, n + 1]
}
print(round(gauss_eliminate(A, b), 6))

singular <- matrix(c(1, 2, 2, 4), 2)
res <- tryCatch(solve(singular), error = function(e) "singular matrix")
print(res)
