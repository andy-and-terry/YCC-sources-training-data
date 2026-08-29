selection_sort <- function(items) {
  n <- length(items)
  for (i in 1:(n - 1)) {
    min_idx <- i
    for (j in (i + 1):n) {
      if (items[j] < items[min_idx]) {
        min_idx <- j
      }
    }
    tmp <- items[i]
    items[i] <- items[min_idx]
    items[min_idx] <- tmp
  }
  items
}

print(selection_sort(c(5, 3, 8, 1, 9, 2)))
