new_queue <- function() {
  list(items = list())
}

enqueue <- function(q, item) {
  q$items[[length(q$items) + 1]] <- item
  q
}

dequeue <- function(q) {
  item <- q$items[[1]]
  q$items <- q$items[-1]
  list(item = item, queue = q)
}

is_empty <- function(q) {
  length(q$items) == 0
}

q <- new_queue()
q <- enqueue(q, "a")
q <- enqueue(q, "b")
q <- enqueue(q, "c")

result <- dequeue(q)
print(result$item)
q <- result$queue

result <- dequeue(q)
print(result$item)
print(is_empty(result$queue))
