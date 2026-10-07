new_min_stack <- function() {
  env <- new.env()
  env$stack <- c()
  env$min_stack <- c()
  env
}

min_stack_push <- function(s, value) {
  s$stack <- c(s$stack, value)
  current_min <- if (length(s$min_stack) == 0) value else min(value, tail(s$min_stack, 1))
  s$min_stack <- c(s$min_stack, current_min)
}

min_stack_pop <- function(s) {
  n <- length(s$stack)
  value <- s$stack[n]
  s$stack <- s$stack[-n]
  s$min_stack <- s$min_stack[-n]
  value
}

min_stack_min <- function(s) {
  tail(s$min_stack, 1)
}

s <- new_min_stack()
min_stack_push(s, 5)
min_stack_push(s, 2)
min_stack_push(s, 7)
print(min_stack_min(s)) # 2
min_stack_pop(s)
print(min_stack_min(s)) # 2
min_stack_pop(s)
print(min_stack_min(s)) # 5
