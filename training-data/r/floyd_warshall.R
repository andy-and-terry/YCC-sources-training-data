floyd_warshall <- function(dist) {
  n <- nrow(dist)
  for (k in 1:n) {
    for (i in 1:n) {
      for (j in 1:n) {
        if (dist[i, k] + dist[k, j] < dist[i, j]) {
          dist[i, j] <- dist[i, k] + dist[k, j]
        }
      }
    }
  }
  dist
}

inf <- Inf
graph <- matrix(c(
  0,   3,   inf, 7,
  8,   0,   2,   inf,
  5,   inf, 0,   1,
  2,   inf, inf, 0
), nrow = 4, byrow = TRUE)

result <- floyd_warshall(graph)
print(result)
