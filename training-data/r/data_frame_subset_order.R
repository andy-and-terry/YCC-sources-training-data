df <- data.frame(n = c("a", "b", "c"), v = c(3, 1, 2))
print(df[df$v > 1, ])
print(df[order(df$v), ])
df$w <- df$v * 2
print(summary(df$w))
