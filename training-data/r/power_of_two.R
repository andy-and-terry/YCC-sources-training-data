is_power_of_two <- function(n) {
  n > 0 && bitwAnd(n, n - 1) == 0
}

print(is_power_of_two(16))
print(is_power_of_two(18))
