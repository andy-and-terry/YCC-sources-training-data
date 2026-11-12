ages <- c(5, 15, 25, 35, 65)
g <- cut(ages, breaks = c(0, 18, 60, Inf), labels = c("child", "adult", "senior"))
print(table(g))
print(levels(g))
