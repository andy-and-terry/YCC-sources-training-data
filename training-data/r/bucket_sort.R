bucket_sort <- function(arr, bucket_count = 5) {
  if (length(arr) == 0) return(arr)

  min_val <- min(arr)
  max_val <- max(arr)
  range_val <- max(max_val - min_val, 1e-9)

  buckets <- vector("list", bucket_count)
  for (v in arr) {
    idx <- min(bucket_count, floor((v - min_val) / range_val * bucket_count) + 1)
    buckets[[idx]] <- c(buckets[[idx]], v)
  }

  result <- c()
  for (b in buckets) {
    result <- c(result, sort(b))
  }
  result
}

print(bucket_sort(c(0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51)))
