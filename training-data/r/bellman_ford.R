bellman_ford <- function(edges, nodes, source) {
  dist <- setNames(as.list(rep(Inf, length(nodes))), nodes)
  dist[[source]] <- 0

  for (i in seq_len(length(nodes) - 1)) {
    for (edge in edges) {
      u <- edge[[1]]; v <- edge[[2]]; w <- edge[[3]]
      if (dist[[u]] + w < dist[[v]]) {
        dist[[v]] <- dist[[u]] + w
      }
    }
  }

  has_negative_cycle <- FALSE
  for (edge in edges) {
    u <- edge[[1]]; v <- edge[[2]]; w <- edge[[3]]
    if (dist[[u]] + w < dist[[v]]) {
      has_negative_cycle <- TRUE
    }
  }

  list(distances = dist, negative_cycle = has_negative_cycle)
}

edges <- list(
  list("a", "b", 4),
  list("a", "c", 5),
  list("b", "c", -3),
  list("c", "d", 4),
  list("d", "b", -6)
)
result <- bellman_ford(edges, c("a", "b", "c", "d"), "a")
print(result$distances)
print(result$negative_cycle)
