# strtoi parses strings in a given base; invalid input becomes NA.
print(strtoi("ff", base = 16L))
print(strtoi("777", base = 8L))
print(strtoi("101101", base = 2L))
print(strtoi("zz", base = 36L))
print(strtoi("12abc", base = 10L))

# A 0x prefix is accepted when parsing base 16
print(strtoi("0x1A", 16L))
print(strtoi(c("10", "20", "30"), 10L))

# Integer to binary string using bitwAnd
to_binary <- function(n) {
  if (n == 0) return("0")
  bits <- character(0)
  while (n > 0) {
    bits <- c(bitwAnd(n, 1L), bits)
    n <- bitwShiftR(n, 1L)
  }
  paste(bits, collapse = "")
}
print(to_binary(45L))
print(strtoi(to_binary(45L), base = 2L))
print(format(as.hexmode(255L)))
print(sprintf("%o", 64L))
