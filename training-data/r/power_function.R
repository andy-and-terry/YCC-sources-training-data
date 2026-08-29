my_power <- function(base, exp) {
  if (exp == 0) return(1)
  if (exp %% 2 == 0) {
    half <- my_power(base, exp %/% 2)
    return(half * half)
  }
  base * my_power(base, exp - 1)
}

print(my_power(2, 10))
print(my_power(3, 5))
