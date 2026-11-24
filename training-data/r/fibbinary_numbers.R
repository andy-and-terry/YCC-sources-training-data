# Fibbinary numbers: no two adjacent 1 bits.
is_fibbinary <- function(n) bitwAnd(n, bitwShiftR(n, 1)) == 0
cat(Filter(is_fibbinary, 0:49), "\n")
