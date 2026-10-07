A <- matrix(c(2, 1, 1, 3), nrow = 2, byrow = TRUE)
b <- c(5, 10)

cat("determinant:", det(A), "\n")

inv_A <- solve(A)
print(inv_A)

# Solve Ax = b directly (more numerically stable than computing inv(A) %*% b).
x <- solve(A, b)
print(x)

eig <- eigen(A)
print(eig$values)
print(eig$vectors)
