to_roman <- function(n) {
  values <- c(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
  symbols <- c("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I")
  result <- ""
  remaining <- n
  for (i in seq_along(values)) {
    while (remaining >= values[i]) {
      result <- paste0(result, symbols[i])
      remaining <- remaining - values[i]
    }
  }
  result
}

print(to_roman(1994))
