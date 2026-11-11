# Count contiguous subarrays whose sum equals k (prefix sums + environment).
count_subarrays <- function(nums, k) {
  seen <- new.env()
  seen[["0"]] <- 1
  total <- 0
  count <- 0
  for (x in nums) {
    total <- total + x
    key <- as.character(total - k)
    if (!is.null(seen[[key]])) count <- count + seen[[key]]
    cur <- as.character(total)
    seen[[cur]] <- (if (is.null(seen[[cur]])) 0 else seen[[cur]]) + 1
  }
  count
}

print(count_subarrays(c(1, 1, 1), 2))
