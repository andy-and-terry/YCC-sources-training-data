class Edge {
  final int to;
  final int weight;
  Edge(this.to, this.weight);
}

List<int> dijkstra(Map<int, List<Edge>> graph, int source, int nodeCount) {
  const inf = 1 << 30;
  final dist = List<int>.filled(nodeCount, inf);
  final visited = List<bool>.filled(nodeCount, false);
  dist[source] = 0;

  for (var iter = 0; iter < nodeCount; iter++) {
    var u = -1;
    var best = inf;
    for (var i = 0; i < nodeCount; i++) {
      if (!visited[i] && dist[i] < best) {
        best = dist[i];
        u = i;
      }
    }
    if (u == -1) break;

    visited[u] = true;
    for (final edge in graph[u] ?? const <Edge>[]) {
      if (dist[u] + edge.weight < dist[edge.to]) {
        dist[edge.to] = dist[u] + edge.weight;
      }
    }
  }

  return dist;
}

void main() {
  final graph = {
    0: [Edge(1, 4), Edge(2, 1)],
    1: [Edge(3, 1)],
    2: [Edge(1, 2), Edge(3, 5)],
    3: <Edge>[],
  };

  print(dijkstra(graph, 0, 4));
}
