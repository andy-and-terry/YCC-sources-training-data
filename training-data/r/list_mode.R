modes <- function(items) {
  counts <- table(items)
  as.numeric(names(counts)[counts == max(counts)])
}

print(modes(c(1, 2, 2, 3, 3, 4)))
