n <- 8
for (r in 0:(n - 1)) {
  row <- sapply(0:r, function(c) if (bitwAnd(r, c) == c) "* " else "  ")
  cat(strrep(" ", n - r - 1), paste(row, collapse = ""), "\n", sep = "")
}
