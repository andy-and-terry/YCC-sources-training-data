binary_search <- function(arr, low, high, target) {
  if (low > high) return(-1)
  mid <- (low + high) %/% 2
  if (arr[mid] == target) return(mid)
  if (arr[mid] < target) return(binary_search(arr, mid + 1, high, target))
  binary_search(arr, low, mid - 1, target)
}

data <- c(1, 3, 5, 7, 9, 11)
print(binary_search(data, 1, length(data), 7))
