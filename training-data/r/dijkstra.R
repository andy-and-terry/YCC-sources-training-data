dijkstra <- function(graph, source) {
  dist <- list()
  for (node in names(graph)) dist[[node]] <- Inf
  dist[[source]] <- 0
  visited <- c()

  for (iter in seq_along(graph)) {
    best_node <- NULL
    best_dist <- Inf
    for (node in names(dist)) {
      if (!(node %in% visited) && dist[[node]] < best_dist) {
        best_node <- node
        best_dist <- dist[[node]]
      }
    }
    if (is.null(best_node)) break
    visited <- c(visited, best_node)
    for (edge in graph[[best_node]]) {
      neighbor <- edge[[1]]
      weight <- edge[[2]]
      new_dist <- best_dist + weight
      if (new_dist < dist[[neighbor]]) {
        dist[[neighbor]] <- new_dist
      }
    }
  }
  dist
}

graph <- list(
  a = list(list("b", 1), list("c", 4)),
  b = list(list("c", 2), list("d", 5)),
  c = list(list("d", 1)),
  d = list()
)
print(dijkstra(graph, "a"))
