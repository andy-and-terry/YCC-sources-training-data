make_adder <- function(n) function(x) x + n
add5 <- make_adder(5)
print(add5(10))
counter <- local({ i <- 0; function() { i <<- i + 1; i } })
counter(); print(counter())
