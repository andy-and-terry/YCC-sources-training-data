# Population count (number of set bits) for 0..15
bits <- function(n) sum(as.integer(intToBits(n)))

cat(sapply(0:15, bits), "\n")
