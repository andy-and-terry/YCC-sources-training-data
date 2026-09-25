quicksort <- function(v) {
  if (length(v) <= 1) return(v)

  pivot <- v[1]
  rest <- v[-1]
  left <- rest[rest < pivot]
  right <- rest[rest >= pivot]

  c(quicksort(left), pivot, quicksort(right))
}

print(quicksort(c(9, 3, 7, 1, 8, 2, 5)))
print(quicksort(c()))
print(quicksort(c(4)))
