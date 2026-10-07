kth_largest <- function(nums, k) {
  sorted <- sort(nums, decreasing = TRUE)
  sorted[k]
}

print(kth_largest(c(3, 2, 1, 5, 6, 4), 2))
print(kth_largest(c(3, 2, 3, 1, 2, 4, 5, 5, 6), 4))
