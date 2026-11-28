bwt <- function(s) {
  n <- nchar(s)
  rots <- vapply(0:(n - 1), function(i) paste0(substring(s, i + 1), substring(s, 1, i)), character(1))
  rots <- sort(rots, method = "radix")
  paste(substring(rots, n, n), collapse = "")
}
cat(bwt("banana$"), "\n")
