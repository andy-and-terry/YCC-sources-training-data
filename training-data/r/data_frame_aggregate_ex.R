df <- data.frame(g = c("a", "b", "a", "b"), v = c(1, 2, 3, 4))
print(aggregate(v ~ g, data = df, FUN = mean))
print(tapply(df$v, df$g, sum))
print(df[df$v > 1 & df$g == "b", ])
df$w <- df$v * 2
print(df)
