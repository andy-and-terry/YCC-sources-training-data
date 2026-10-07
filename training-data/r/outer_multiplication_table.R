tbl <- outer(1:9, 1:9)
print(tbl[1:5, 1:5])

dimnames(tbl) <- list(1:9, 1:9)
print(tbl["7", "8"])

sums <- outer(1:3, 1:4, "+")
print(sums)

powers <- outer(1:4, 0:3, function(base, exp) base^exp)
print(powers)

greet <- outer(c("Hello", "Bye"), c("Ann", "Bob"), paste)
print(greet)

x <- seq(-1, 1, by = 0.5)
y <- seq(-1, 1, by = 0.5)
z <- outer(x, y, function(a, b) a^2 + b^2)
print(z)

divisible <- outer(1:12, c(2, 3, 5), function(n, d) n %% d == 0)
rownames(divisible) <- 1:12
colnames(divisible) <- c("by2", "by3", "by5")
print(divisible[rowSums(divisible) == 2, , drop = FALSE])

print(1:3 %o% 1:3)
print(sum(diag(outer(1:5, 1:5))))
