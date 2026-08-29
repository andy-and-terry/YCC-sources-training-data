visit_node <- function(node, graph, visited, order) {
  if (node %in% visited) return(list(visited = visited, order = order))
  visited <- c(visited, node)
  for (dep in graph[[node]]) {
    result <- visit_node(dep, graph, visited, order)
    visited <- result$visited
    order <- result$order
  }
  order <- c(order, node)
  list(visited = visited, order = order)
}

topo_sort <- function(graph) {
  visited <- c()
  order <- c()
  for (node in names(graph)) {
    result <- visit_node(node, graph, visited, order)
    visited <- result$visited
    order <- result$order
  }
  order
}

graph <- list(a = c("b", "c"), b = c("d"), c = c("d"), d = c())
print(topo_sort(graph))
