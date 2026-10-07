class Edge {
  final int from;
  final int to;
  final int weight;
  Edge(this.from, this.to, this.weight);
}

List<int> bellmanFord(List<Edge> edges, int nodeCount, int source) {
  const inf = 1 << 30;
  final dist = List<int>.filled(nodeCount, inf);
  dist[source] = 0;

  for (var i = 0; i < nodeCount - 1; i++) {
    for (final edge in edges) {
      if (dist[edge.from] != inf && dist[edge.from] + edge.weight < dist[edge.to]) {
        dist[edge.to] = dist[edge.from] + edge.weight;
      }
    }
  }

  for (final edge in edges) {
    if (dist[edge.from] != inf && dist[edge.from] + edge.weight < dist[edge.to]) {
      print('negative-weight cycle detected');
    }
  }

  return dist;
}

void main() {
  final edges = [
    Edge(0, 1, 4),
    Edge(0, 2, 1),
    Edge(2, 1, 2),
    Edge(1, 3, 1),
    Edge(2, 3, 5),
  ];

  print(bellmanFord(edges, 4, 0));
}
