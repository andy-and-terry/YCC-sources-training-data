rows <- list(c(1, 2), c(3, 4), c(5, 6))
print(do.call(rbind, rows))
print(do.call(sum, as.list(1:10)))
print(do.call("paste", list("a", "b", sep = "-")))

compose <- function(...) {
  fs <- list(...)
  function(x) Reduce(function(acc, f) f(acc), fs, x)
}
pipeline <- compose(function(x) x + 1, function(x) x * 2, sqrt)
print(pipeline(7))

print(Reduce(`+`, 1:5, accumulate = TRUE))
print(Reduce(function(a, b) paste0(b, a), strsplit("abc", "")[[1]]))
print(Filter(function(x) x %% 2 == 0, 1:10))
print(Map(function(a, b) a * b, 1:3, 4:6))
print(Position(function(x) x > 3, c(1, 5, 2, 7)))
print(Find(function(x) x > 3, c(1, 5, 2, 7)))
sq <- function(x) x^2
print((1:4) |> sq() |> sum())
