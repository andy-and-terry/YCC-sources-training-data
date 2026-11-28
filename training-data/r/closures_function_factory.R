make_power <- function(n) function(x) x^n
sq <- make_power(2)
cube <- make_power(3)
cat(sq(4), cube(2), "\n")
