# do.call applies a function to a list of arguments
parts <- list(c(a = 1, b = 2), c(a = 3, b = 4), c(a = 5, b = 6))
m <- do.call(rbind, parts)
print(m)

print(do.call(sum, list(1, 2, 3, 4)))
print(do.call("paste", list("a", "b", sep = "-")))

dfs <- lapply(1:3, function(i) data.frame(id = i, sq = i^2))
print(do.call(rbind, dfs))

print(Reduce(`+`, 1:5, accumulate = TRUE))
