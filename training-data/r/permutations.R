permutations <- function(items) {
  if (length(items) <= 1) return(list(items))

  result <- list()
  for (i in seq_along(items)) {
    rest <- items[-i]
    for (p in permutations(rest)) {
      result[[length(result) + 1]] <- c(items[i], p)
    }
  }
  result
}

for (p in permutations(c(1, 2, 3))) {
  print(p)
}
