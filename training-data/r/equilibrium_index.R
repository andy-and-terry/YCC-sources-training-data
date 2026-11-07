equilibrium_index <- function(nums) {
  total <- sum(nums)
  left <- 0
  for (i in seq_along(nums)) {
    if (left == total - left - nums[i]) return(i)
    left <- left + nums[i]
  }
  NA_integer_
}

print(equilibrium_index(c(1, 7, 3, 6, 5, 6))) # 4 (1-based)
