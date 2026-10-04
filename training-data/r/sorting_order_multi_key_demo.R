df <- data.frame(
  name = c("Cy", "Ann", "Bob", "Di"),
  dept = c("eng", "ops", "eng", "ops"),
  salary = c(90, 70, 85, 70)
)
print(df[order(df$dept, -df$salary), ])
print(df[order(df$salary, df$name, decreasing = c(TRUE, FALSE), method = "radix"), ])
print(sort(c(3, 1, 2), decreasing = TRUE))
print(sort(c("banana", "apple", "Cherry")))
print(rank(c(10, 30, 20, 20)))
print(rev(sort(table(c("a", "b", "a", "c", "a", "b")))))
print(head(df[order(-df$salary), "name"], 2))
print(unique(df$dept))
print(duplicated(c(1, 2, 1, 3, 2)))
print(is.unsorted(c(1, 3, 2)))
