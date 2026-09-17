new_fenwick <- function(n) {
  list(n = n, tree = numeric(n + 1))
}

fenwick_update <- function(fen, index, delta) {
  i <- index
  while (i <= fen$n) {
    fen$tree[i] <- fen$tree[i] + delta
    i <- i + (i & (-i))
  }
  fen
}

fenwick_prefix_sum <- function(fen, index) {
  total <- 0
  i <- index
  while (i > 0) {
    total <- total + fen$tree[i]
    i <- i - (i & (-i))
  }
  total
}

fenwick_range_sum <- function(fen, left, right) {
  fenwick_prefix_sum(fen, right) - fenwick_prefix_sum(fen, left - 1)
}

values <- c(3, 2, -1, 6, 5, 4, -3, 3, 7, 2)
fen <- new_fenwick(length(values))
for (i in seq_along(values)) {
  fen <- fenwick_update(fen, i, values[i])
}

print(fenwick_range_sum(fen, 1, 5))
fen <- fenwick_update(fen, 3, 10)
print(fenwick_range_sum(fen, 1, 5))
