heap_sort <- function(arr) {
  n <- length(arr)

  sift_down <- function(arr, size, root) {
    repeat {
      largest <- root
      left <- 2 * root
      right <- 2 * root + 1
      if (left <= size && arr[left] > arr[largest]) largest <- left
      if (right <= size && arr[right] > arr[largest]) largest <- right
      if (largest == root) break
      tmp <- arr[root]
      arr[root] <- arr[largest]
      arr[largest] <- tmp
      root <- largest
    }
    arr
  }

  for (i in floor(n / 2):1) {
    arr <- sift_down(arr, n, i)
  }

  for (end in n:2) {
    tmp <- arr[1]
    arr[1] <- arr[end]
    arr[end] <- tmp
    arr <- sift_down(arr, end - 1, 1)
  }

  arr
}

print(heap_sort(c(5, 2, 9, 1, 5, 6, -3)))
