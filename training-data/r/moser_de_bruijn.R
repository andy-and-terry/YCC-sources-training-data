# Read the binary digits of i as base-4 digits.
moser_de_bruijn <- function(i) {
  value <- 0; power <- 1
  while (i > 0) {
    if (i %% 2 == 1) value <- value + power
    power <- power * 4
    i <- i %/% 2
  }
  value
}
cat(sapply(0:9, moser_de_bruijn), "\n") # 0 1 4 5 16 17 20 21 64 65
