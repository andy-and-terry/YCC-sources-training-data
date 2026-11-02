make_adder <- function(n) function(x) x + n
add3 <- make_adder(3)
print(add3(10))
