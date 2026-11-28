is_happy <- function(n) {
  seen <- c()
  while (n != 1 && !(n %in% seen)) {
    seen <- c(seen, n)
    n <- sum(as.integer(strsplit(as.character(n), "")[[1]])^2)
  }
  n == 1
}

print(Filter(is_happy, 1:40)) # 1 7 10 13 19 23 28 31 32 44
