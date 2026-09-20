quicksort <- function(items) {
  if (length(items) <= 1) {
    return(items)
  }
  pivot <- items[[length(items) %/% 2 + 1]]
  left <- items[items < pivot]
  mid <- items[items == pivot]
  right <- items[items > pivot]
  c(quicksort(left), mid, quicksort(right))
}

print(quicksort(c(5, 3, 8, 1, 9, 2)))
