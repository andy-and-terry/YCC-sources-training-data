quicksort <- function(arr) {
  if (length(arr) <= 1) return(arr)
  pivot <- arr[1]
  rest <- arr[-1]
  c(quicksort(rest[rest < pivot]), pivot, quicksort(rest[rest >= pivot]))
}

values <- c(5, 3, 8, 1, 9, 2, 7)
print(quicksort(values))
