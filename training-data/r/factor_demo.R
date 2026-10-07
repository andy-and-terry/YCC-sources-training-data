sizes <- factor(c("small", "large", "medium", "small", "large"),
                levels = c("small", "medium", "large"), ordered = TRUE)
print(sizes)
print(levels(sizes))
print(as.integer(sizes))
print(table(sizes))
print(sizes < "large")
print(max(sizes))

f <- factor(c("a", "b", "a", "c"))
levels(f)[levels(f) == "c"] <- "z"
print(f)
print(droplevels(f[f != "z"]))
print(nlevels(f))

ages <- c(5, 17, 25, 40, 70)
groups <- cut(ages, breaks = c(0, 18, 65, Inf), labels = c("child", "adult", "senior"))
print(data.frame(ages, groups))
print(tapply(ages, groups, mean))
