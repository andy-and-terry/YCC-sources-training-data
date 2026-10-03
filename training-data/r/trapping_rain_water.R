trap_rain_water <- function(heights) {
  n <- length(heights)
  if (n == 0) return(0)

  left <- 1
  right <- n
  left_max <- heights[left]
  right_max <- heights[right]
  trapped <- 0

  while (left < right) {
    if (left_max <= right_max) {
      left <- left + 1
      left_max <- max(left_max, heights[left])
      trapped <- trapped + (left_max - heights[left])
    } else {
      right <- right - 1
      right_max <- max(right_max, heights[right])
      trapped <- trapped + (right_max - heights[right])
    }
  }
  trapped
}

print(trap_rain_water(c(0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1)))
print(trap_rain_water(c(4, 2, 0, 3, 2, 5)))
