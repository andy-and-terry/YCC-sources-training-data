x <- 1:5
print(sapply(x, function(i) i^2))
print(vapply(x, function(i) i * 2, numeric(1)))
print(mapply(function(a, b) a + b, 1:3, 4:6))
m <- matrix(1:6, nrow = 2)
print(apply(m, 1, sum))
print(lapply(list(a = 1:3, b = 4:6), mean))
