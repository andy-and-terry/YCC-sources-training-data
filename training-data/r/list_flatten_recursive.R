flatten <- function(x) {
  if (!is.list(x)) return(list(x))
  do.call(c, lapply(x, flatten))
}

nested <- list(1, list(2, list(3, 4)), list(), list(list(5)))
print(unlist(flatten(nested)))
print(unlist(nested))

depth <- function(x) {
  if (!is.list(x) || length(x) == 0) return(0)
  1 + max(sapply(x, depth))
}
print(depth(nested))

tree <- list(a = 1, b = list(c = 2, d = list(e = 3)))
print(unlist(tree))
print(names(unlist(tree)))
print(rapply(tree, function(v) v * 10, how = "unlist"))
