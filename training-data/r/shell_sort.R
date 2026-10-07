shell_sort <- function(arr) {
  n <- length(arr)
  gap <- floor(n / 2)

  while (gap > 0) {
    for (i in (gap + 1):n) {
      temp <- arr[i]
      j <- i
      while (j > gap && arr[j - gap] > temp) {
        arr[j] <- arr[j - gap]
        j <- j - gap
      }
      arr[j] <- temp
    }
    gap <- floor(gap / 2)
  }
  arr
}

print(shell_sort(c(9, 8, 3, 7, 5, 6, 4, 1)))
