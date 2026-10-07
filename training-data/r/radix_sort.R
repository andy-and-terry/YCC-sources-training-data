radix_sort <- function(arr) {
  if (length(arr) == 0) return(arr)
  max_val <- max(arr)
  exp <- 1

  while (max_val %/% exp > 0) {
    buckets <- vector("list", 10)
    for (v in arr) {
      digit <- (v %/% exp) %% 10
      buckets[[digit + 1]] <- c(buckets[[digit + 1]], v)
    }
    arr <- unlist(buckets)
    exp <- exp * 10
  }
  arr
}

print(radix_sort(c(170, 45, 75, 90, 802, 24, 2, 66)))
