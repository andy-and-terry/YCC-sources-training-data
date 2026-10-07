# Modular exponentiation via repeated squaring (values kept small to avoid
# double-precision overflow: mod < 2^26)
mod_pow <- function(base, exp, m) {
  result <- 1
  base <- base %% m
  while (exp > 0) {
    if (exp %% 2 == 1) result <- (result * base) %% m
    base <- (base * base) %% m
    exp <- exp %/% 2
  }
  result
}

print(mod_pow(2, 10, 1000))
print(mod_pow(3, 200, 13))
print(mod_pow(7, 100, 1000003))
