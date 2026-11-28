a <- c(5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5)
bs <- 4
blk <- tapply(a, (seq_along(a) - 1) %/% bs, sum)
query <- function(l, r) {  # 0-based inclusive
  s <- 0; i <- l
  while (i <= r) {
    if (i %% bs == 0 && i + bs - 1 <= r) { s <- s + blk[[i %/% bs + 1]]; i <- i + bs }
    else { s <- s + a[i + 1]; i <- i + 1 }
  }
  s
}
print(query(2, 9))
