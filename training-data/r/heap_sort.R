sift_down <- function(v, start, end) {
  root <- start
  repeat {
    child <- 2 * root
    if (child > end) break
    if (child + 1 <= end && v[child + 1] > v[child]) child <- child + 1
    if (v[root] >= v[child]) break
    tmp <- v[root]
    v[root] <- v[child]
    v[child] <- tmp
    root <- child
  }
  v
}

heap_sort <- function(items) {
  # 1-indexed binary heap stored directly in the vector.
  v <- items
  n <- length(v)
  for (start in floor(n / 2):1) {
    v <- sift_down(v, start, n)
  }
  for (end in n:2) {
    tmp <- v[1]
    v[1] <- v[end]
    v[end] <- tmp
    v <- sift_down(v, 1, end - 1)
  }
  v
}

print(heap_sort(c(5, 2, 9, 1, 5, 6, -3, 0)))
