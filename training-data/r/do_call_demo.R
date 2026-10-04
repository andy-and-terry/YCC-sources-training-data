args <- list(1:10, na.rm = TRUE)
print(do.call(mean, args))

pieces <- list("a", "b", "c", sep = "-")
print(do.call(paste, pieces))

frames <- list(
  data.frame(id = 1:2, v = c("x", "y")),
  data.frame(id = 3:4, v = c("z", "w"))
)
combined <- do.call(rbind, frames)
print(combined)

vectors <- list(c(1, 2), c(3, 4), c(5, 6))
print(do.call(cbind, vectors))

print(do.call("sum", list(1, 2, 3)))

compose <- function(...) {
  fs <- list(...)
  function(x) Reduce(function(acc, f) f(acc), fs, x)
}
inc_then_square <- compose(function(x) x + 1, function(x) x^2)
print(inc_then_square(3))

params <- list(n = 5, mean = 10, sd = 0)
print(do.call(rnorm, params))
