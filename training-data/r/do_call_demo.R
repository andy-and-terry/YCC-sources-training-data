args <- list(1:10)
print(do.call(sum, args))
print(do.call("paste", list("a", "b", sep = "-")))

rows <- list(
  data.frame(id = 1, name = "a"),
  data.frame(id = 2, name = "b"),
  data.frame(id = 3, name = "c")
)
print(do.call(rbind, rows))

nested <- list(c(1, 2), c(3, 4), c(5, 6))
print(do.call(cbind, nested))
print(do.call(mapply, c(list(FUN = function(x, y) x + y), list(1:3, 4:6))))

compose <- function(...) {
  fs <- list(...)
  function(x) Reduce(function(acc, f) f(acc), fs, x)
}
inc_then_double <- compose(function(x) x + 1, function(x) x * 2)
print(inc_then_double(5))
