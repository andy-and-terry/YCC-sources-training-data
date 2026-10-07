x <- c(1, 1, 2, 2, 2, 3, 1, 1)
r <- rle(x)
print(r$lengths)
print(r$values)
print(inverse.rle(r))

# Longest run
print(max(r$lengths))
print(r$values[which.max(r$lengths)])

s <- strsplit("aaabccdddd", "")[[1]]
rs <- rle(s)
print(paste0(rs$values, rs$lengths, collapse = ""))
