make_range_sum <- function(values) {
  prefix <- c(0, cumsum(values))
  function(lo, hi) prefix[hi + 1] - prefix[lo + 1]
}

query <- make_range_sum(c(3, 1, 4, 1, 5, 9, 2, 6))
print(query(2, 5))
