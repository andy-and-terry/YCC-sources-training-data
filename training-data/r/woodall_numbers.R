woodall <- function(n) n * 2^n - 1

nums <- as.integer(sapply(1:10, woodall))
cat(paste(nums, collapse = " "), "\n", sep = "")
