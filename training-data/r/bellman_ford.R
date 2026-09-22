bellman_ford <- function(nodes, edges, source) {
  dist <- setNames(rep(Inf, length(nodes)), nodes)
  dist[[source]] <- 0

  for (iter in 1:(length(nodes) - 1)) {
    for (edge in edges) {
      u <- edge[[1]]
      v <- edge[[2]]
      w <- edge[[3]]
      if (dist[[u]] + w < dist[[v]]) {
        dist[[v]] <- dist[[u]] + w
      }
    }
  }

  # one extra pass detects a negative-weight cycle: if any edge can
  # still relax a distance, no shortest path is well-defined.
  for (edge in edges) {
    u <- edge[[1]]
    v <- edge[[2]]
    w <- edge[[3]]
    if (dist[[u]] + w < dist[[v]]) {
      stop("graph contains a negative-weight cycle")
    }
  }

  dist
}

nodes <- c("a", "b", "c", "d")
edges <- list(
  list("a", "b", 4),
  list("a", "c", 5),
  list("b", "c", -3),
  list("c", "d", 4),
  list("b", "d", 6)
)

print(bellman_ford(nodes, edges, "a"))
