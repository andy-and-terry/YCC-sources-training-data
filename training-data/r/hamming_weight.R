popcount <- function(n) {
  c <- 0
  while (n > 0) {
    c <- c + bitwAnd(n, 1)
    n <- bitwShiftR(n, 1)
  }
  c
}

print(popcount(183))
print(sum(as.integer(intToBits(183))))
