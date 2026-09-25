base_values <- c(2, 3, 4)
exponents <- c(3, 2, 1)

print(mapply(function(b, e) b^e, base_values, exponents))

repeat_char <- function(char, times) {
  paste(rep(char, times), collapse = "")
}
print(mapply(repeat_char, c("a", "b", "c"), c(1, 2, 3)))

vectorized_repeat <- Vectorize(repeat_char)
print(vectorized_repeat(c("x", "y"), c(2, 4)))
