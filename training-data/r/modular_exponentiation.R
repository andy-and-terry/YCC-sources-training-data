mod_pow <- function(base, exp, modulus) {
  result <- 1
  base <- base %% modulus
  while (exp > 0) {
    if (exp %% 2 == 1) {
      result <- (result * base) %% modulus
    }
    base <- (base * base) %% modulus
    exp <- exp %/% 2
  }
  result
}

print(mod_pow(2, 10, 1000))
print(mod_pow(3, 200, 13))
print(mod_pow(7, 1e6 + 5, 1e6 + 3))
