is_armstrong <- function(n) {
  d <- as.integer(strsplit(as.character(n), "")[[1]])
  sum(d^length(d)) == n
}

print(Filter(is_armstrong, 1:999)) # 1..9 153 370 371 407
