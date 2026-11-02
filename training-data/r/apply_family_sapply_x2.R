m <- matrix(1:6, nrow = 2)
print(apply(m, 1, sum))
print(sapply(1:5, function(i) i^2))
print(vapply(list(1:3, 4:9), length, integer(1)))
