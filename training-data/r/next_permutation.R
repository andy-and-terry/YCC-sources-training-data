next_permutation <- function(arr) {
  n <- length(arr)
  i <- n - 1
  while (i >= 1 && arr[i] >= arr[i + 1]) i <- i - 1

  if (i >= 1) {
    j <- n
    while (arr[j] <= arr[i]) j <- j - 1
    tmp <- arr[i]; arr[i] <- arr[j]; arr[j] <- tmp
  }

  lo <- i + 1
  hi <- n
  while (lo < hi) {
    tmp <- arr[lo]; arr[lo] <- arr[hi]; arr[hi] <- tmp
    lo <- lo + 1
    hi <- hi - 1
  }
  arr
}

print(next_permutation(c(1, 2, 3)))
print(next_permutation(c(3, 2, 1)))
print(next_permutation(c(1, 1, 5)))
