# Set operations on vectors plus %in% and match().
a <- c(1, 2, 3, 4, 5)
b <- c(4, 5, 6, 7)

print(union(a, b))
print(intersect(a, b))
print(setdiff(a, b))
print(setequal(c(1, 2), c(2, 1, 1)))

print(3 %in% a)
print(a %in% b)
print(match(c(5, 9), a))
print(unique(c(3, 1, 3, 2, 1)))
print(duplicated(c("x", "y", "x", "z", "y")))
print(which(a > 2))
