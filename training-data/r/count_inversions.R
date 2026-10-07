count_inversions <- function(v) {
  if (length(v) <= 1) return(list(sorted = v, count = 0))
  mid <- length(v) %/% 2
  l <- count_inversions(v[1:mid])
  r <- count_inversions(v[(mid + 1):length(v)])
  merged <- numeric(0)
  cross <- 0
  i <- 1
  j <- 1
  while (i <= length(l$sorted) && j <= length(r$sorted)) {
    if (l$sorted[i] <= r$sorted[j]) {
      merged <- c(merged, l$sorted[i])
      i <- i + 1
    } else {
      merged <- c(merged, r$sorted[j])
      cross <- cross + length(l$sorted) - i + 1
      j <- j + 1
    }
  }
  if (i <= length(l$sorted)) merged <- c(merged, l$sorted[i:length(l$sorted)])
  if (j <= length(r$sorted)) merged <- c(merged, r$sorted[j:length(r$sorted)])
  list(sorted = merged, count = l$count + r$count + cross)
}

print(count_inversions(c(2, 4, 1, 3, 5))$count)  # 3
print(count_inversions(c(5, 4, 3, 2, 1))$count)  # 10
