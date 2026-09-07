quickselect <- function(arr, k) {
  if (length(arr) == 1) return(arr[1])

  pivot <- arr[sample(length(arr), 1)]
  lows <- arr[arr < pivot]
  highs <- arr[arr > pivot]
  pivots <- arr[arr == pivot]

  if (k <= length(highs)) {
    quickselect(highs, k)
  } else if (k <= length(highs) + length(pivots)) {
    pivot
  } else {
    quickselect(lows, k - length(highs) - length(pivots))
  }
}

kth_largest <- function(arr, k) {
  quickselect(arr, k)
}

values <- c(3, 2, 1, 5, 6, 4, 8, 7)
print(kth_largest(values, 2))
print(kth_largest(values, 1))
