jaccard <- function(a, b) {
  u <- length(union(a, b))
  if (u == 0) 1 else length(intersect(a, b)) / u
}

print(jaccard(c(1, 2, 3, 4), c(3, 4, 5)))
