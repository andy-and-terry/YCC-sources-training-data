sieve <- function(limit) {
  is_composite <- rep(FALSE, limit)
  for (i in 2:floor(sqrt(limit))) {
    if (!is_composite[i]) {
      for (j in seq(i * i, limit, by = i)) {
        is_composite[j] <- TRUE
      }
    }
  }
  which(!is_composite)[which(!is_composite) >= 2]
}

print(sieve(50))
