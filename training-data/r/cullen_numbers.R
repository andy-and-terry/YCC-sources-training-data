cullen <- function(n) n * 2^n + 1

nums <- as.integer(sapply(0:9, cullen))
cat(paste(nums, collapse = " "), "\n", sep = "")
