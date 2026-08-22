my_gcd <- function(a, b) {
  while (b != 0) {
    temp <- b
    b <- a %% b
    a <- temp
  }
  a
}

print(my_gcd(48, 18))
print(my_gcd(100, 75))
