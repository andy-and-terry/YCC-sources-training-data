is_self_describing <- function(n) {
  digits <- as.integer(strsplit(as.character(n), "")[[1]])
  all(vapply(seq_along(digits), function(i) sum(digits == i - 1) == digits[i], logical(1)))
}

for (n in c(1210, 2020, 21200, 1211)) {
  cat(n, is_self_describing(n), "\n")
}
