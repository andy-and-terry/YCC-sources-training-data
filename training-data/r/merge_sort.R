merge_arrays <- function(left, right) {
  result <- c()
  i <- 1
  j <- 1
  while (i <= length(left) && j <= length(right)) {
    if (left[i] <= right[j]) {
      result <- c(result, left[i])
      i <- i + 1
    } else {
      result <- c(result, right[j])
      j <- j + 1
    }
  }
  c(result, left[i:length(left)][i <= length(left)], right[j:length(right)][j <= length(right)])
}

merge_sort <- function(items) {
  if (length(items) <= 1) return(items)
  mid <- length(items) %/% 2
  left <- merge_sort(items[1:mid])
  right <- merge_sort(items[(mid + 1):length(items)])
  merge_arrays(left, right)
}

print(merge_sort(c(5, 2, 9, 1, 5, 6)))
