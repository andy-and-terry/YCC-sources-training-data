# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
is_munchausen <- function(n) {
  d <- as.integer(strsplit(as.character(n), "")[[1]])
  sum(ifelse(d == 0, 0, d^d)) == n
}

cat(Filter(is_munchausen, 1:4999), "\n")
