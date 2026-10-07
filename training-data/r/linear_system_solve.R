# Solve A x = b with solve(), then verify
A <- matrix(c(2, 1, -1,
              -3, -1, 2,
              -2, 1, 2), nrow = 3, byrow = TRUE)
b <- c(8, -11, -3)

x <- solve(A, b)
print(x)                          # 2 3 -1
print(all.equal(as.vector(A %*% x), b))

print(det(A))
print(round(solve(A) %*% A, 10))  # identity
print(diag(3))
