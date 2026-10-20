e <- new.env()
assign("x", 10, envir = e)
print(get("x", envir = e)); print(exists("y", envir = e)); print(ls(e)); print(mget(c("x"), envir = e))
local({ y <- 5; print(y * 2) })
f <- function() { x <- "local"; g <- function() x; g() }
print(f())
x <- "global"
h <- function() { x <<- "modified"; x }
print(h()); print(x)
counter_env <- function() { env <- environment(); count <- 0; list(inc = function() { env$count <- env$count + 1 }, get = function() count) }
cc <- counter_env(); cc$inc(); cc$inc()
print(cc$get())
print(environmentName(globalenv())); print(environmentName(environment(sum))); print(class(environment()))
ff <- function() parent.frame()
print(identical(ff(), globalenv()))
print(eval(quote(a + b), list(a = 1, b = 2)))
expr <- quote(x * 2)
print(eval(expr, list(x = 21))); print(class(expr)); print(deparse(expr)); print(substitute(a + b, list(a = 1)))
g2 <- function(arg) deparse(substitute(arg))
print(g2(my_variable + 1))
print(body(function(x) x + 1)); print(formals(function(a, b = 2) NULL)$b); print(nchar(Sys.getenv("HOME")) > 0)
