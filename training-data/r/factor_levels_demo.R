sizes <- factor(c("small", "large", "medium", "small", "large", "small"))
print(sizes)
print(levels(sizes))
print(table(sizes))

ordered_sizes <- factor(
  c("small", "large", "medium", "small"),
  levels = c("small", "medium", "large"),
  ordered = TRUE
)
print(ordered_sizes)
print(ordered_sizes < "large")
print(max(ordered_sizes))
print(sort(ordered_sizes, decreasing = TRUE))

print(as.integer(ordered_sizes))

levels(sizes)[levels(sizes) == "medium"] <- "mid"
print(levels(sizes))

dropped <- droplevels(sizes[sizes != "large"])
print(levels(dropped))

ages <- c(5, 17, 25, 42, 67, 80)
groups <- cut(ages, breaks = c(0, 17, 64, Inf), labels = c("child", "adult", "senior"))
print(groups)
print(tapply(ages, groups, mean))

print(nlevels(sizes))
print(as.character(sizes))
print(relevel(sizes, ref = "small"))
