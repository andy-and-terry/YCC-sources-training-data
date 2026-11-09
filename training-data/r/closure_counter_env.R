make_counter <- function() {
  i <- 0
  function() {
    i <<- i + 1
    i
  }
}
cnt <- make_counter()
cnt(); cnt()
print(cnt())
