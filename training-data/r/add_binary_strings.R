add_binary <- function(a, b) {
  x <- rev(as.integer(strsplit(a, "")[[1]]))
  y <- rev(as.integer(strsplit(b, "")[[1]]))
  n <- max(length(x), length(y))
  length(x) <- n; x[is.na(x)] <- 0L
  length(y) <- n; y[is.na(y)] <- 0L
  carry <- 0L
  out <- integer(0)
  for (i in seq_len(n)) {
    s <- x[i] + y[i] + carry
    out <- c(s %% 2L, out)
    carry <- s %/% 2L
  }
  if (carry > 0L) out <- c(1L, out)
  paste(out, collapse = "")
}

print(add_binary("1010", "1011")) # "10101"
