# Moser-de Bruijn sequence: binary digits of n read in base 4.
moser <- function(n) {
  result <- 0
  place <- 1
  while (n > 0) {
    if (bitwAnd(n, 1) == 1) result <- result + place
    n <- bitwShiftR(n, 1)
    place <- place * 4
  }
  result
}

cat(sapply(0:11, moser), "\n")
