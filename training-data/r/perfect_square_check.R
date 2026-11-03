is_perfect_square <- function(n) n >= 0 & round(sqrt(n))^2 == n

print((0:29)[is_perfect_square(0:29)])
