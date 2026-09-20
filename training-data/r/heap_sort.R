sift_down <- function(items, start, end) {
  root <- start
  repeat {
    left <- 2 * root + 1
    right <- 2 * root + 2
    largest <- root
    if (left <= end && items[left + 1] > items[largest + 1]) largest <- left
    if (right <= end && items[right + 1] > items[largest + 1]) largest <- right
    if (largest == root) break
    tmp <- items[root + 1]
    items[root + 1] <- items[largest + 1]
    items[largest + 1] <- tmp
    root <- largest
  }
  items
}

heap_sort <- function(items) {
  n <- length(items)
  if (n <= 1) return(items)

  for (start in (floor(n / 2) - 1):0) {
    items <- sift_down(items, start, n - 1)
  }

  for (end in (n - 1):1) {
    tmp <- items[1]
    items[1] <- items[end + 1]
    items[end + 1] <- tmp
    items <- sift_down(items, 0, end - 1)
  }
  items
}

print(heap_sort(c(5, 3, 8, 1, 9, 2, 7)))
