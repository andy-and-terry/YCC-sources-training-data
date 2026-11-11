four_sum_count <- function(a, b, c, d) {
  ab <- table(as.vector(outer(a, b, "+")))
  cd <- -as.vector(outer(c, d, "+"))
  hits <- ab[as.character(cd)]
  sum(hits, na.rm = TRUE)
}

print(four_sum_count(c(1, 2), c(-2, -1), c(-1, 2), c(0, 2))) # 2
