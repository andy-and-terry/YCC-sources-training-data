df <- data.frame(
  department = c("eng", "eng", "sales", "sales", "hr"),
  salary = c(90000, 95000, 70000, 72000, 60000)
)

print(tapply(df$salary, df$department, mean))

groups <- split(df, df$department)
print(lapply(groups, function(g) sum(g$salary)))

summary_df <- aggregate(salary ~ department, data = df, FUN = mean)
print(summary_df)
