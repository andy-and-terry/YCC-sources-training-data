popcount <- function(n) sum(as.integer(intToBits(n)))
gould <- function(n) 2^popcount(n)

print(sapply(0:15, gould))
