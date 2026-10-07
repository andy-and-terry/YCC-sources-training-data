gray_code <- function(n) {
  i <- 0:(2^n - 1)
  bitwXor(i, bitwShiftR(i, 1L))
}

to_bin <- function(x, width) {
  vapply(x, function(v) {
    paste(rev(as.integer(intToBits(v))[1:width]), collapse = "")
  }, character(1))
}

codes <- gray_code(3)
print(to_bin(codes, 3))
diffs <- bitwXor(codes[-1], codes[-length(codes)])
print(all(diffs %in% c(1, 2, 4)))
