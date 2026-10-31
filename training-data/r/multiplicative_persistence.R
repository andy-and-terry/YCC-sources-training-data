persistence <- function(n) {
  steps <- 0
  while (n >= 10) {
    n <- prod(as.integer(strsplit(as.character(n), "")[[1]]))
    steps <- steps + 1
  }
  steps
}

for (n in c(39, 77, 999, 10)) {
  cat(n, persistence(n), "\n")
}
