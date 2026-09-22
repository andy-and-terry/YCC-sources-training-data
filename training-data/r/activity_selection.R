activity_selection <- function(start, finish) {
  order_idx <- order(finish)
  start <- start[order_idx]
  finish <- finish[order_idx]

  selected <- c(1)
  last_finish <- finish[1]
  for (i in 2:length(start)) {
    if (start[i] >= last_finish) {
      selected <- c(selected, i)
      last_finish <- finish[i]
    }
  }
  selected
}

start <- c(1, 3, 0, 5, 8, 5)
finish <- c(2, 4, 6, 7, 9, 9)
print(activity_selection(start, finish))
