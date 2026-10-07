df <- data.frame(
  name = c("Ann", "Bob", "Cy", "Di"),
  dept = c("eng", "ops", "eng", "ops"),
  salary = c(100, 90, 120, 90)
)

print(df[order(df$dept, -df$salary), ])
print(df[order(df$salary, df$name, decreasing = c(TRUE, FALSE), method = "radix"), ])

x <- c(3, 1, 4, 1, 5, 9, 2, 6)
print(sort(x))
print(sort(x, decreasing = TRUE))
print(order(x))
print(rank(x, ties.method = "min"))
print(rev(x))
print(x[order(-x)][1:3])
print(sort(c("banana", "Apple", "cherry")))
print(which.max(x)); print(which(x > 3))
