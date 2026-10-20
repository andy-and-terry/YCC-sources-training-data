make_counter <- function() { i <- 0; function() { i <<- i + 1; i } }
c1 <- make_counter(); c1(); c1()
print(c1())
adders <- lapply(1:3, function(n) function(x) x + n)
print(sapply(adders, function(f) f(10)))
compose <- function(...) { fs <- list(...); function(x) Reduce(function(acc, f) f(acc), fs, x) }
print(compose(sqrt, function(v) v + 1, round)(16))
power <- function(p) function(x) x^p
sq <- power(2); cube <- power(3)
print(c(sq(4), cube(2)))
print((function(x, y = x * 2) x + y)(3))
f <- function(x, ...) { args <- list(...); length(args) }
print(f(1, 2, 3))
g <- function(a, b) { if (missing(b)) "no b" else b }
print(g(1)); print(g(1, "B"))
print(do.call("sum", list(1, 2, 3)))
memo <- local({ cache <- c(); function(n) { key <- as.character(n); if (!is.null(cache[key]) && !is.na(cache[key])) return(cache[[key]]); v <- if (n < 2) n else Recall(n - 1) + Recall(n - 2); cache[key] <<- v; v } })
print(memo(20))
print(Vectorize(function(a, b) a + b)(1:3, 2))
