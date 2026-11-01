make_power <- function(n) function(x) x^n
square <- make_power(2)
cube <- make_power(3)
print(square(4))
print(cube(2))
counter <- local({ i <- 0; function() { i <<- i + 1; i } })
counter(); print(counter())
