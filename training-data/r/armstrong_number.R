is_armstrong <- function(n) {
  digits_str <- as.character(n)
  digits_vec <- as.numeric(strsplit(digits_str, "")[[1]])
  power <- length(digits_vec)
  total <- sum(digits_vec ^ power)
  total == n
}

print(is_armstrong(153))
print(is_armstrong(154))
