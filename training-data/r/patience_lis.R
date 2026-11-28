lis_length <- function(a) {
  tails <- numeric()
  for (x in a) {
    i <- which(tails >= x)[1]
    if (is.na(i)) tails <- c(tails, x) else tails[i] <- x
  }
  length(tails)
}
print(lis_length(c(10, 9, 2, 5, 3, 7, 101, 18)))
