# Integer (1..3999) to Roman numeral using a greedy table.
values <- c(1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1)
symbols <- c("M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I")

to_roman <- function(n) {
  out <- ""
  for (i in seq_along(values)) {
    while (n >= values[i]) {
      out <- paste0(out, symbols[i])
      n <- n - values[i]
    }
  }
  out
}

cat(to_roman(1994), to_roman(58), "\n")
