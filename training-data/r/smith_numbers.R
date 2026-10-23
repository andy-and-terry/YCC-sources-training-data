digit_sum <- function(n) sum(as.integer(strsplit(as.character(n), "")[[1]]))

prime_factors <- function(n) {
  fs <- c()
  p <- 2L
  while (n > 1) {
    if (p * p > n) {
      fs <- c(fs, n)
      break
    }
    while (n %% p == 0) {
      fs <- c(fs, p)
      n <- n %/% p
    }
    p <- p + 1L
  }
  fs
}

is_smith <- function(n) {
  fs <- prime_factors(n)
  length(fs) > 1 && digit_sum(n) == sum(sapply(fs, digit_sum))
}

smiths <- Filter(is_smith, 2:99)
cat(paste(smiths, collapse = " "), "\n", sep = "")
