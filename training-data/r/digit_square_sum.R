digit_square_sum <- function(n) {
  digits <- as.integer(strsplit(as.character(abs(n)), "")[[1]])
  sum(digits^2)
}

print(digit_square_sum(123))
print(digit_square_sum(-99))
