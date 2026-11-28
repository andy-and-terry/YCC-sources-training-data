is_factorion <- function(n) {
  d <- as.integer(strsplit(as.character(n), "")[[1]])
  sum(factorial(d)) == n
}

print(Filter(is_factorion, 1:49999)) # 1 2 145 40585
