make_adder <- function(n) function(x) x + n
add5 <- make_adder(5)
print(add5(10))
compose <- function(f, g) function(x) g(f(x))
print(compose(sqrt, function(v) v * 2)(16))
