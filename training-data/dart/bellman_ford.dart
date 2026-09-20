class Edge {
  final int from;
  final int to;
  final int weight;
  Edge(this.from, this.to, this.weight);
}

List<int> bellmanFord(int vertexCount, List<Edge> edges, int source) {
  final dist = List<int>.filled(vertexCount, 1 << 30);
  dist[source] = 0;

  for (var i = 0; i < vertexCount - 1; i++) {
    for (final edge in edges) {
      if (dist[edge.from] != (1 << 30) &&
          dist[edge.from] + edge.weight < dist[edge.to]) {
        dist[edge.to] = dist[edge.from] + edge.weight;
      }
    }
  }

  for (final edge in edges) {
    if (dist[edge.from] != (1 << 30) &&
        dist[edge.from] + edge.weight < dist[edge.to]) {
      throw StateError('graph contains a negative-weight cycle');
    }
  }

  return dist;
}

void main() {
  final edges = [
    Edge(0, 1, 4),
    Edge(0, 2, 5),
    Edge(1, 2, -3),
    Edge(2, 3, 4),
    Edge(3, 1, -6),
  ];

  print(bellmanFord(4, edges, 0));
}
