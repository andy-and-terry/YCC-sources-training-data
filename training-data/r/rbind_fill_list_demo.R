rows <- list(
  data.frame(id = 1, name = "a"),
  data.frame(id = 2, name = "b"),
  data.frame(id = 3, name = "c")
)
df <- do.call(rbind, rows)
print(df)
print(nrow(df)); print(ncol(df))
df$flag <- df$id > 1
print(df)
df <- df[df$flag, ]
print(rownames(df))
rownames(df) <- NULL
print(df)
df <- rbind(df, data.frame(id = 9, name = "z", flag = FALSE))
print(df)
print(sapply(df, class))
print(colnames(df)[sapply(df, is.numeric)])
print(unique(df$name))
print(head(df, 2)); print(df[nrow(df):1, ])
print(Reduce(function(a, b) merge(a, b, by = "id"), list(df[, 1:2], df[, c(1, 3)])))
