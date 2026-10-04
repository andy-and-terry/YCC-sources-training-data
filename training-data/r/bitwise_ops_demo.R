a <- 12L
b <- 10L
print(bitwAnd(a, b))
print(bitwOr(a, b))
print(bitwXor(a, b))
print(bitwShiftL(1L, 4L))
print(bitwShiftR(256L, 3L))
print(bitwNot(5L))

to_binary <- function(n) {
  if (n == 0) return("0")
  bits <- c()
  while (n > 0) {
    bits <- c(n %% 2, bits)
    n <- n %/% 2
  }
  paste(bits, collapse = "")
}
print(to_binary(37))

count_bits <- function(n) sum(as.integer(intToBits(n)))
print(count_bits(255L))
print(strtoi("101101", base = 2))
print(strtoi("ff", 16L))
print(as.hexmode(255))
is_pow2 <- function(n) n > 0 && bitwAnd(n, n - 1L) == 0
print(sapply(c(1L, 6L, 8L, 64L), is_pow2))
