df <- data.frame(
  name = c("Ada", "Bob", "Cleo"),
  score = c(88, 72, 95)
)

df$grade <- ifelse(df$score >= 90, "A", ifelse(df$score >= 80, "B", "C"))
print(df)
print(mean(df$score))
print(df[order(-df$score), ])
