counting_sort <- function(v) {
  if (length(v) == 0) return(v)

  min_val <- min(v)
  max_val <- max(v)
  counts <- integer(max_val - min_val + 1)

  for (x in v) {
    counts[x - min_val + 1] <- counts[x - min_val + 1] + 1
  }

  result <- c()
  for (i in seq_along(counts)) {
    if (counts[i] > 0) {
      result <- c(result, rep(i - 1 + min_val, counts[i]))
    }
  }
  result
}

print(counting_sort(c(4, 2, 2, 8, 3, 3, 1)))
print(counting_sort(c(-1, -5, 0, 3, -1)))
