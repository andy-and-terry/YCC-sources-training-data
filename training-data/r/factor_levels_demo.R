sizes <- factor(c("small", "large", "medium", "small", "large"),
                levels = c("small", "medium", "large"), ordered = TRUE)
print(sizes)
print(levels(sizes))
print(as.integer(sizes))
print(table(sizes))
print(sizes[1] < sizes[2])
print(max(sizes))

f <- factor(c("a", "b", "a", "c"))
levels(f)[levels(f) == "a"] <- "alpha"
print(f)
print(droplevels(f[f != "c"]))
print(nlevels(f))

ages <- c(5, 17, 30, 65, 80)
groups <- cut(ages, breaks = c(0, 18, 64, Inf), labels = c("child", "adult", "senior"))
print(groups)
print(tapply(ages, groups, mean))
