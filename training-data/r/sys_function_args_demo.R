f <- function(x, y = 2, ...) {
  cat("called as:", deparse(match.call()), "\n")
  cat("missing y?", missing(y), "\n")
  extras <- list(...)
  cat("extras:", length(extras), "\n")
  x + y
}
print(f(1))
print(f(1, 3, z = 9, 10))
print(formals(f)$y)
print(names(formals(f)))
print(body(function(a) a + 1))
print(args(sum))
print(do.call(f, list(5, y = 5)))
print(nargs())
g <- function(...) names(list(...))
print(g(a = 1, 2, b = 3))
h <- function(...) ..2
print(h("a", "b", "c"))
print((function(...) ...length())(1, 2, 3))
