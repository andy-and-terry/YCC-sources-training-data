# seq_along and seq_len are safe where 1:n is not.

x <- c()
n <- length(x)

cat("1:n for empty vector  :", 1:n, "\n")      # 1 0 -- a classic bug
cat("seq_len(n)            :", seq_len(n), "\n")
cat("seq_along(x)          :", seq_along(x), "\n")

# The unsafe loop runs twice on empty input.
count <- 0
for (i in 1:length(x)) count <- count + 1
cat("iterations with 1:n   :", count, "\n")

count <- 0
for (i in seq_along(x)) count <- count + 1
cat("iterations with seq_along:", count, "\n")

# Works on any vector, and on lists.
fruit <- list("apple", "pear", "plum")
for (i in seq_along(fruit)) {
  cat(i, ":", fruit[[i]], "\n")
}

# Reverse iteration: rev(seq_along()) rather than length(x):1.
for (i in rev(seq_along(fruit))) cat(fruit[[i]], "")
cat("\n")

print(seq(10, 1, by = -3))
print(seq(0, 1, length.out = 5))
