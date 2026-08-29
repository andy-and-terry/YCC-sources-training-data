two_sum <- function(nums, target) {
  seen <- new.env()
  for (i in seq_along(nums)) {
    complement <- as.character(target - nums[i])
    if (!is.null(seen[[complement]])) {
      return(c(seen[[complement]], i))
    }
    seen[[as.character(nums[i])]] <- i
  }
  c()
}

print(two_sum(c(2, 7, 11, 15), 9))
