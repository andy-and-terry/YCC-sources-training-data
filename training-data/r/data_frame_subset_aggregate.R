df <- data.frame(g = c("a", "b", "a", "b"), v = c(1, 2, 3, 4))
print(df[df$v > 1, ])
print(aggregate(v ~ g, data = df, FUN = sum))
df$w <- df$v * 10
print(head(df, 2))
print(table(df$g))
