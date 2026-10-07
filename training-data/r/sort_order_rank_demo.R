x <- c(30, 10, 20, 10)
print(sort(x))
print(sort(x, decreasing = TRUE))
print(order(x))                 # indices that would sort x
print(rank(x))                  # ties averaged
print(rank(x, ties.method = "min"))
print(rev(x))

df <- data.frame(name = c("c", "a", "b"), score = c(2, 3, 2))
print(df[order(-df$score, df$name), ])
print(which.max(x))
print(which(x == 10))
print(sort(c("banana", "apple", "Cherry")))
