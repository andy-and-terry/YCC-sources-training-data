Stack <- function() {
  items <- list()
  push <- function(x) { items[[length(items) + 1]] <<- x; invisible(NULL) }
  pop <- function() {
    if (length(items) == 0) stop("stack empty")
    top <- items[[length(items)]]
    items[[length(items)]] <<- NULL
    top
  }
  size <- function() length(items)
  peek <- function() items[[length(items)]]
  list(push = push, pop = pop, size = size, peek = peek)
}
s <- Stack()
s$push(1); s$push("two"); s$push(c(3, 3))
print(s$size())
print(s$pop())
print(s$peek())
print(s$pop()); print(s$pop())
print(tryCatch(s$pop(), error = function(e) conditionMessage(e)))
