binary_search <- function(arr, target) {
  low <- 1
  high <- length(arr)
  while (low <= high) {
    mid <- (low + high) %/% 2
    if (arr[mid] == target) {
      return(mid)
    } else if (arr[mid] < target) {
      low <- mid + 1
    } else {
      high <- mid - 1
    }
  }
  -1
}

sorted <- c(1, 3, 5, 7, 9, 11, 13)
print(binary_search(sorted, 7))
print(binary_search(sorted, 4))
