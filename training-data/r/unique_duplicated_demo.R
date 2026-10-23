x <- c(3, 1, 3, 2, 1, 5, 3)

print(unique(x))
print(duplicated(x))
print(x[!duplicated(x)])
print(x[duplicated(x)])
print(duplicated(x, fromLast = TRUE))
print(anyDuplicated(x))

df <- data.frame(id = c(1, 2, 2, 3), v = c("a", "b", "b", "c"))
print(unique(df))
print(df[!duplicated(df$id), ])

print(rev(unique(rev(x))))
print(table(x)[table(x) > 1])
