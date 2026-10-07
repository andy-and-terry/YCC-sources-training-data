graph <- list(
  a = c("b", "c"),
  b = c("a", "d"),
  c = c("a", "d"),
  d = c("b", "c", "e"),
  e = c("d")
)

bfs <- function(graph, start) {
  visited <- c(start)
  queue <- c(start)
  order_visited <- c()

  while (length(queue) > 0) {
    node <- queue[1]
    queue <- queue[-1]
    order_visited <- c(order_visited, node)

    for (neighbor in graph[[node]]) {
      if (!(neighbor %in% visited)) {
        visited <- c(visited, neighbor)
        queue <- c(queue, neighbor)
      }
    }
  }
  order_visited
}

dfs <- function(graph, start, visited = c()) {
  visited <- c(visited, start)
  for (neighbor in graph[[start]]) {
    if (!(neighbor %in% visited)) {
      visited <- dfs(graph, neighbor, visited)
    }
  }
  visited
}

print(bfs(graph, "a"))
print(dfs(graph, "a"))
