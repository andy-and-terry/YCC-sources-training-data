alternating_digit_sum <- function(n) {
  digits <- rev(as.integer(strsplit(as.character(n), "")[[1]]))
  sum(digits * rep(c(1, -1), length.out = length(digits)))
}

for (n in c(1234, 99999, 1000)) {
  cat(n, alternating_digit_sum(n), "\n")
}
