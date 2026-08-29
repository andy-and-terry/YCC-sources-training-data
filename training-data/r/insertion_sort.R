insertion_sort <- function(items) {
  for (i in 2:length(items)) {
    key <- items[i]
    j <- i - 1
    while (j >= 1 && items[j] > key) {
      items[j + 1] <- items[j]
      j <- j - 1
    }
    items[j + 1] <- key
  }
  items
}

print(insertion_sort(c(12, 11, 13, 5, 6)))
