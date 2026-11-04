ugly <- function(n) {
  seq <- 1
  i2 <- i3 <- i5 <- 1
  while (length(seq) < n) {
    nxt <- min(seq[i2] * 2, seq[i3] * 3, seq[i5] * 5)
    seq <- c(seq, nxt)
    if (nxt == seq[i2] * 2) i2 <- i2 + 1
    if (nxt == seq[i3] * 3) i3 <- i3 + 1
    if (nxt == seq[i5] * 5) i5 <- i5 + 1
  }
  seq[n]
}

print(sapply(1:12, ugly))
