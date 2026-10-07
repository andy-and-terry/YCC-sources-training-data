ages <- c(5, 17, 18, 25, 40, 65, 70)
groups <- cut(ages, breaks = c(0, 17, 64, Inf),
              labels = c("child", "adult", "senior"))
print(groups)
print(table(groups))

words <- c("a", "b", "a", "c", "a", "b")
tb <- table(words)
print(tb[order(-tb)])
print(names(which.max(tb)))
print(prop.table(tb))
print(tabulate(c(1, 2, 2, 5)))
