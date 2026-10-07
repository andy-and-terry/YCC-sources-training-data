a <- 12L  # 1100
b <- 10L  # 1010
print(bitwAnd(a, b))
print(bitwOr(a, b))
print(bitwXor(a, b))
print(bitwShiftL(1L, 4L))
print(bitwShiftR(256L, 3L))
print(bitwNot(5L))

popcount <- function(n) {
  count <- 0L
  while (n > 0L) {
    count <- count + bitwAnd(n, 1L)
    n <- bitwShiftR(n, 1L)
  }
  count
}
print(popcount(255L))
print(rev(as.integer(intToBits(5L))[1:8]))
