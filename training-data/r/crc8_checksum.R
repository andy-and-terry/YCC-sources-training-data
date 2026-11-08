crc8 <- function(bytes) {
  crc <- 0L
  for (b in bytes) {
    crc <- bitwXor(crc, b)
    for (i in 1:8) {
      crc <- if (bitwAnd(crc, 128L) != 0L) bitwAnd(bitwXor(bitwShiftL(crc, 1L), 7L), 255L) else bitwAnd(bitwShiftL(crc, 1L), 255L)
    }
  }
  crc
}
cat(sprintf("%02x\n", crc8(utf8ToInt("123456789"))))
