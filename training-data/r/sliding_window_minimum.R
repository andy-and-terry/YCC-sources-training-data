sliding_window_min <- function(nums, k) {
  deque <- c() # stores indices, values increasing left to right
  result <- c()

  for (i in seq_along(nums)) {
    while (length(deque) > 0 && deque[1] <= i - k) deque <- deque[-1]
    while (length(deque) > 0 && nums[deque[length(deque)]] >= nums[i]) {
      deque <- deque[-length(deque)]
    }
    deque <- c(deque, i)
    if (i >= k) result <- c(result, nums[deque[1]])
  }
  result
}

print(sliding_window_min(c(1, 3, -1, -3, 5, 3, 6, 7), 3))
print(sliding_window_min(c(9, 8, 7, 6), 2))
