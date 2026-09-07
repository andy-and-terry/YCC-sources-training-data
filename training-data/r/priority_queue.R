new_heap <- function() {
  list(items = c())
}

heap_push <- function(h, value) {
  h$items <- c(h$items, value)
  i <- length(h$items)
  while (i > 1) {
    parent <- i %/% 2
    if (h$items[parent] <= h$items[i]) break
    tmp <- h$items[parent]
    h$items[parent] <- h$items[i]
    h$items[i] <- tmp
    i <- parent
  }
  h
}

heap_pop <- function(h) {
  n <- length(h$items)
  top <- h$items[1]
  h$items[1] <- h$items[n]
  h$items <- h$items[-n]
  n <- n - 1
  i <- 1
  repeat {
    left <- 2 * i
    right <- 2 * i + 1
    smallest <- i
    if (left <= n && h$items[left] < h$items[smallest]) smallest <- left
    if (right <= n && h$items[right] < h$items[smallest]) smallest <- right
    if (smallest == i) break
    tmp <- h$items[smallest]
    h$items[smallest] <- h$items[i]
    h$items[i] <- tmp
    i <- smallest
  }
  list(value = top, heap = h)
}

h <- new_heap()
for (v in c(5, 3, 8, 1, 9, 2)) {
  h <- heap_push(h, v)
}

sorted <- c()
while (length(h$items) > 0) {
  result <- heap_pop(h)
  sorted <- c(sorted, result$value)
  h <- result$heap
}
print(sorted)
