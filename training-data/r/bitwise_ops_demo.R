print(bitwAnd(12L, 10L))
print(bitwOr(12L, 10L))
print(bitwXor(12L, 10L))
print(bitwShiftL(1L, 4L))
print(bitwShiftR(256L, 3L))
print(bitwNot(5L))

is_power_of_two <- function(n) n > 0 && bitwAnd(n, n - 1L) == 0

print(sapply(c(1L, 6L, 8L, 64L, 100L), is_power_of_two))

popcount <- function(n) {
  count <- 0L
  while (n > 0L) {
    count <- count + bitwAnd(n, 1L)
    n <- bitwShiftR(n, 1L)
  }
  count
}

print(popcount(255L))
print(rev(as.integer(intToBits(10L))[1:8]))
