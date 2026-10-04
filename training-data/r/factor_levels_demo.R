# Factors store categories as integer codes with a levels attribute.
sizes <- factor(c("small", "large", "medium", "small"),
                levels = c("small", "medium", "large"),
                ordered = TRUE)
print(sizes)
print(as.integer(sizes))
print(sizes < "large")
print(levels(sizes))
print(table(sizes))

f <- factor(c("a", "b", "a"))
levels(f) <- c("alpha", "beta")
print(f)

g <- factor(c("x", "y", "z"))[1:2]
print(levels(g))
print(levels(droplevels(g)))
print(nlevels(f))
