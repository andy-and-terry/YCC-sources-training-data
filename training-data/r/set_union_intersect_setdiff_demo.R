a <- c(1, 2, 3, 4, 5, 5)
b <- c(4, 5, 6, 7)

print(union(a, b))
print(intersect(a, b))
print(setdiff(a, b))
print(setdiff(b, a))
print(unique(a))

# Symmetric difference built from two setdiffs
print(union(setdiff(a, b), setdiff(b, a)))

# Set equality ignores order and duplicates
print(setequal(c(3, 1, 2), c(1, 2, 2, 3)))
print(is.element(6, b))

# Works on character vectors too
x <- c("apple", "pear", "fig")
y <- c("fig", "kiwi")
print(intersect(x, y))
print(union(x, y))
