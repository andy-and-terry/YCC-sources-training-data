to_base <- function(n, base) {
  if (n == 0) return("0")
  digits <- c(0:9, letters)
  out <- character(0)
  while (n > 0) {
    out <- c(digits[n %% base + 1], out)
    n <- n %/% base
  }
  paste(out, collapse = "")
}

for (b in c(2, 8, 16, 36)) cat("255 in base", b, "=", to_base(255, b), "\n")
print(strtoi("ff", 16L))
print(strtoi("1010", base = 2))
