is_factorion <- function(n) {
  digits <- as.integer(strsplit(as.character(n), "")[[1]])
  sum(factorial(digits)) == n
}

print(Filter(is_factorion, 1:49999))
