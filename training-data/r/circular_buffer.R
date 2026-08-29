new_circular_buffer <- function(capacity) {
  list(data = rep(0, capacity), capacity = capacity, size = 0, start = 0)
}

push_buffer <- function(buf, value) {
  index <- (buf$start + buf$size) %% buf$capacity + 1
  buf$data[index] <- value
  if (buf$size < buf$capacity) {
    buf$size <- buf$size + 1
  } else {
    buf$start <- (buf$start + 1) %% buf$capacity
  }
  buf
}

to_vector <- function(buf) {
  sapply(0:(buf$size - 1), function(i) buf$data[(buf$start + i) %% buf$capacity + 1])
}

buf <- new_circular_buffer(3)
for (v in c(1, 2, 3, 4, 5)) {
  buf <- push_buffer(buf, v)
}
print(to_vector(buf))
