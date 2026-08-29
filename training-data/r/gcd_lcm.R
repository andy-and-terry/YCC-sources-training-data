my_gcd <- function(a, b) {
  while (b != 0) {
    t <- b
    b <- a %% b
    a <- t
  }
  abs(a)
}

my_lcm <- function(a, b) {
  abs(a * b) / my_gcd(a, b)
}

print(my_gcd(48, 18))
print(my_lcm(4, 6))
