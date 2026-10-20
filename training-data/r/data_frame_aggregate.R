df <- data.frame(g = c("a", "b", "a", "b"), v = c(1, 2, 3, 4))
print(aggregate(v ~ g, df, mean))
print(tapply(df$v, df$g, sum))
print(df[order(-df$v), ])
