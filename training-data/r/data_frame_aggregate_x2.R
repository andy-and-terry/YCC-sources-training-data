df <- data.frame(g = c("a", "b", "a", "b"), v = c(1, 2, 3, 4))
print(aggregate(v ~ g, data = df, FUN = mean))
