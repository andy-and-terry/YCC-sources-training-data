m <- matrix(1:9, nrow = 3, byrow = TRUE)

print(apply(m, 1, sum))
print(apply(m, 2, sum))
print(apply(m, 1, max))

multiplication_table <- outer(1:5, 1:5, "*")
print(multiplication_table)

print(outer(c("a", "b"), c("x", "y"), paste0))
