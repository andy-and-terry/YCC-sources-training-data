sizes <- factor(c("small", "large", "medium", "small", "large", "small"),
                levels = c("small", "medium", "large"), ordered = TRUE)
print(levels(sizes))
print(table(sizes))
print(sizes[1] < sizes[2])
print(as.integer(sizes))
print(droplevels(sizes[sizes != "medium"]))
