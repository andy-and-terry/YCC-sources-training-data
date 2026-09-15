make_fenwick <- function(size) {
  list(tree = numeric(size + 1), size = size)
}

fenwick_add <- function(fw, index, delta) {
  i <- index + 1
  while (i <= fw$size) {
    fw$tree[i] <- fw$tree[i] + delta
    i <- i + bitwAnd(i, -i)
  }
  fw
}

fenwick_prefix_sum <- function(fw, index) {
  i <- index + 1
  total <- 0
  while (i > 0) {
    total <- total + fw$tree[i]
    i <- i - bitwAnd(i, -i)
  }
  total
}

fenwick_range_sum <- function(fw, left, right) {
  if (left > 0) {
    fenwick_prefix_sum(fw, right) - fenwick_prefix_sum(fw, left - 1)
  } else {
    fenwick_prefix_sum(fw, right)
  }
}

values <- c(1, 3, 5, 7, 9, 11)
fw <- make_fenwick(length(values))
for (i in seq_along(values)) {
  fw <- fenwick_add(fw, i - 1, values[i])
}
print(fenwick_range_sum(fw, 1, 3))
