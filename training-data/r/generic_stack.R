new_stack <- function() {
  list(items = c())
}

push_stack <- function(s, item) {
  s$items <- c(s$items, item)
  s
}

pop_stack <- function(s) {
  n <- length(s$items)
  item <- s$items[n]
  s$items <- s$items[-n]
  list(item = item, stack = s)
}

s <- new_stack()
s <- push_stack(s, 1)
s <- push_stack(s, 2)
s <- push_stack(s, 3)
result <- pop_stack(s)
print(result$item)
result2 <- pop_stack(result$stack)
print(result2$item)
