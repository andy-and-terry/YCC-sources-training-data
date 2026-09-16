sliding_window_max <- function(nums, k) {
  result <- c()
  deque <- c()

  for (i in seq_along(nums)) {
    while (length(deque) > 0 && deque[1] <= i - k) {
      deque <- deque[-1]
    }
    while (length(deque) > 0 && nums[deque[length(deque)]] <= nums[i]) {
      deque <- deque[-length(deque)]
    }
    deque <- c(deque, i)

    if (i >= k) {
      result <- c(result, nums[deque[1]])
    }
  }

  result
}

nums <- c(1, 3, -1, -3, 5, 3, 6, 7)
print(sliding_window_max(nums, 3))
