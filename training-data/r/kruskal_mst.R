find_root <- function(parent, x) {
  while (parent[x] != x) {
    x <- parent[x]
  }
  x
}

kruskal_mst <- function(n, edges) {
  edges <- edges[order(sapply(edges, function(e) e[[3]]))]
  parent <- 1:n
  mst <- list()
  total_weight <- 0

  for (edge in edges) {
    u <- edge[[1]]
    v <- edge[[2]]
    w <- edge[[3]]
    root_u <- find_root(parent, u)
    root_v <- find_root(parent, v)
    if (root_u != root_v) {
      parent[root_u] <- root_v
      mst[[length(mst) + 1]] <- edge
      total_weight <- total_weight + w
    }
  }

  list(edges = mst, weight = total_weight)
}

edges <- list(
  list(1, 2, 4),
  list(1, 3, 1),
  list(2, 3, 2),
  list(2, 4, 5),
  list(3, 4, 8)
)

result <- kruskal_mst(4, edges)
print(result$weight)
print(result$edges)
