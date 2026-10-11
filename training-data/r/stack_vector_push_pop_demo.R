stack <- c()
push <- function(s, x) c(s, x)
pop <- function(s) head(s, -1)
top <- function(s) tail(s, 1)

stack <- push(stack, 1)
stack <- push(stack, 2)
stack <- push(stack, 3)
print(top(stack))
stack <- pop(stack)
print(stack)
print(length(stack))

queue <- c("a", "b", "c")
front <- queue[1]
queue <- queue[-1]
print(front)
print(queue)
print(append(queue, "z", after = 1))
print(head(letters, 3)); print(tail(letters, 2))
print(setdiff(1:5, 2:3)); print(union(1:3, 2:5)); print(intersect(1:5, 3:8))
print(is.null(c()))
