df <- data.frame(g = c("a", "b", "a", "b"), v = 1:4)
print(aggregate(v ~ g, df, sum))
print(tapply(df$v, df$g, mean))
print(df[order(-df$v), ][1:2, ])
