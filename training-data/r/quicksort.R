quicksort <- function(items) {
  if (length(items) <= 1) return(items)
  pivot <- items[[1]]
  rest <- items[-1]
  left <- rest[rest < pivot]
  right <- rest[rest >= pivot]
  c(quicksort(left), pivot, quicksort(right))
}

print(quicksort(c(5, 2, 9, 1, 5, 6, -3)))
