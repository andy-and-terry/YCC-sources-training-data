duval <- function(s) {
  ch <- strsplit(s, "")[[1]]; n <- length(ch)
  out <- character(); i <- 1
  while (i <= n) {
    j <- i + 1; k <- i
    while (j <= n && ch[k] <= ch[j]) {
      k <- if (ch[k] < ch[j]) i else k + 1
      j <- j + 1
    }
    while (i <= k) {
      out <- c(out, substr(s, i, i + j - k - 1))
      i <- i + j - k
    }
  }
  out
}
print(duval("banana"))
