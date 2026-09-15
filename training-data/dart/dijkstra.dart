const int infinity = 1 << 30;

Map<int, int> dijkstra(Map<int, List<MapEntry<int, int>>> graph, int source) {
  final dist = {for (final node in graph.keys) node: infinity};
  dist[source] = 0;
  final visited = <int>{};

  while (visited.length < graph.length) {
    int? current;
    var best = infinity;
    for (final node in graph.keys) {
      if (!visited.contains(node) && dist[node]! < best) {
        best = dist[node]!;
        current = node;
      }
    }
    if (current == null) break;
    visited.add(current);

    for (final edge in graph[current] ?? []) {
      final candidate = dist[current]! + edge.value;
      if (candidate < (dist[edge.key] ?? infinity)) {
        dist[edge.key] = candidate;
      }
    }
  }
  return dist;
}

void main() {
  final graph = {
    0: [const MapEntry(1, 4), const MapEntry(2, 1)],
    1: [const MapEntry(3, 1)],
    2: [const MapEntry(1, 2), const MapEntry(3, 5)],
    3: <MapEntry<int, int>>[],
  };
  print(dijkstra(graph, 0));
}
