bubble_sort <- function(items) {
  n <- length(items)
  for (i in 1:(n - 1)) {
    for (j in 1:(n - i)) {
      if (items[j] > items[j + 1]) {
        tmp <- items[j]
        items[j] <- items[j + 1]
        items[j + 1] <- tmp
      }
    }
  }
  items
}

print(bubble_sort(c(5, 3, 8, 1, 9, 2)))
