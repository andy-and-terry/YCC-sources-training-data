compose <- function(...) {
  fs <- list(...)
  function(x) Reduce(function(acc, f) f(acc), fs, x)
}

inc <- function(x) x + 1
dbl <- function(x) x * 2
pipeline <- compose(inc, dbl, sqrt)
print(pipeline(7))   # sqrt((7 + 1) * 2) = 4

print(sapply(1:3, compose(dbl, inc)))

curry <- function(f, x) function(y) f(x, y)
add5 <- curry(`+`, 5)
print(add5(10))

print(Map(function(f, v) f(v), list(sqrt, abs), list(16, -3)))
print(c(1, 4, 9) |> sqrt() |> sum())
