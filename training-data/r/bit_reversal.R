reverse_bits <- function(value, width = 8) {
  bits <- as.integer(intToBits(value))[1:width]  # little endian
  sum(bits * 2^((width - 1):0))
}

for (v in c(1, 6, 13, 128)) cat(v, reverse_bits(v), "\n") # 128 96 176 1
