column_title <- function(n) {
  out <- ""
  while (n > 0) {
    n <- n - 1
    out <- paste0(LETTERS[n %% 26 + 1], out)
    n <- n %/% 26
  }
  out
}

cat(column_title(28), column_title(701), "\n") # AB ZY
