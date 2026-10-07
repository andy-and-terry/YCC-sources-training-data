x <- c(30, 10, 20, 10, 50)

print(sort(x))
print(sort(x, decreasing = TRUE))
print(order(x))
print(order(-x))
print(rank(x))
print(rank(x, ties.method = "min"))
print(rev(x))
print(which.max(x))
print(which(x == 10))

df <- data.frame(
  name = c("Cy", "Ann", "Bob", "Dee"),
  dept = c("ops", "dev", "dev", "ops"),
  salary = c(50, 70, 65, 80),
  stringsAsFactors = FALSE
)
print(df[order(df$salary), ])
print(df[order(df$dept, -df$salary), ])
print(df[order(df$name, decreasing = TRUE), "name"])

words <- c("banana", "Apple", "cherry", "apple")
print(sort(words))
print(sort(words, method = "radix"))
print(words[order(nchar(words), words)])

print(head(sort(x, decreasing = TRUE), 3))
print(x[order(x)][1:2])
print(is.unsorted(x))
print(cummax(x))
