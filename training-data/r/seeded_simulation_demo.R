# Reproducible random simulation with set.seed, sample and rbinom.
set.seed(42)

rolls <- sample(1:6, 1000, replace = TRUE)
print(table(rolls))
print(round(mean(rolls), 2))

flips <- rbinom(10, size = 1, prob = 0.5)
print(flips)

inside <- 0
n <- 10000
x <- runif(n)
y <- runif(n)
inside <- sum(x^2 + y^2 <= 1)
print(round(4 * inside / n, 1))

print(sample(c("a", "b", "c", "d"), 2))
set.seed(42)
print(sample(1:6, 3))
