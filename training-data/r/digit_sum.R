digit_sum <- function(n) {
  total <- 0
  while (n > 0) {
    total <- total + n %% 10
    n <- n %/% 10
  }
  total
}

print(digit_sum(12345))
