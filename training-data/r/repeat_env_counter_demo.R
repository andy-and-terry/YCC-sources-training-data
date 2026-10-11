make_counter <- function(start = 0) {
  count <- start
  list(
    inc = function(by = 1) { count <<- count + by; invisible(count) },
    get = function() count,
    reset = function() count <<- start
  )
}
c1 <- make_counter()
c2 <- make_counter(100)
c1$inc(); c1$inc(5)
c2$inc()
print(c(c1$get(), c2$get()))
c1$reset()
print(c1$get())
print(environmentName(environment(sum)))
print(ls(environment(c1$inc)))
f <- function() { x <- 1; g <- function() x <<- x + 1; g(); x }
print(f())
