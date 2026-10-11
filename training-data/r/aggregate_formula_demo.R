df <- data.frame(
  dept = c("a", "b", "a", "b", "c"),
  sex = c("m", "f", "f", "m", "f"),
  pay = c(10, 20, 30, 40, 50)
)
print(aggregate(pay ~ dept, data = df, FUN = mean))
print(aggregate(pay ~ dept + sex, data = df, FUN = sum))
print(aggregate(df$pay, by = list(dept = df$dept), FUN = max))
print(tapply(df$pay, df$dept, sum))
print(with(df, tapply(pay, list(dept, sex), sum)))
print(by(df$pay, df$dept, mean))
print(df[order(df$dept, -df$pay), ])
df$rank <- ave(df$pay, df$dept, FUN = function(v) rank(-v))
print(df)
print(subset(df, pay > 15, select = c(dept, pay)))
print(table(df$dept, df$sex))
