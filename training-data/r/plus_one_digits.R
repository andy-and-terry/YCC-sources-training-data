plus_one <- function(d) {
  for (i in rev(seq_along(d))) {
    if (d[i] < 9) {
      d[i] <- d[i] + 1
      return(d)
    }
    d[i] <- 0
  }
  c(1, d)
}

print(plus_one(c(1, 2, 9))) # 1 3 0
print(plus_one(c(9, 9)))    # 1 0 0
