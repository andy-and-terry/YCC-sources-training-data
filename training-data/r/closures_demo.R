make_counter <- function() {
  count <- 0
  function() {
    count <<- count + 1
    count
  }
}

counter1 <- make_counter()
counter2 <- make_counter()
print(counter1())
print(counter1())
print(counter2())
