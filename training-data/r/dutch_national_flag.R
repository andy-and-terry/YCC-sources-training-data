dutch_national_flag <- function(arr, pivot = 1) {
  low <- 1
  mid <- 1
  high <- length(arr)

  while (mid <= high) {
    if (arr[mid] < pivot) {
      tmp <- arr[low]; arr[low] <- arr[mid]; arr[mid] <- tmp
      low <- low + 1
      mid <- mid + 1
    } else if (arr[mid] == pivot) {
      mid <- mid + 1
    } else {
      tmp <- arr[mid]; arr[mid] <- arr[high]; arr[high] <- tmp
      high <- high - 1
    }
  }
  arr
}

print(dutch_national_flag(c(2, 0, 2, 1, 1, 0)))
print(dutch_national_flag(c(2, 0, 1)))
