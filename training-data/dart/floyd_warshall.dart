const int infinity = 1 << 30;

List<List<int>> floydWarshall(List<List<int>> graph) {
  final n = graph.length;
  final dist = List.generate(n, (i) => List<int>.from(graph[i]));

  for (var k = 0; k < n; k++) {
    for (var i = 0; i < n; i++) {
      for (var j = 0; j < n; j++) {
        if (dist[i][k] + dist[k][j] < dist[i][j]) {
          dist[i][j] = dist[i][k] + dist[k][j];
        }
      }
    }
  }
  return dist;
}

void main() {
  final graph = [
    [0, 5, infinity, 10],
    [infinity, 0, 3, infinity],
    [infinity, infinity, 0, 1],
    [infinity, infinity, infinity, 0],
  ];

  final dist = floydWarshall(graph);
  for (final row in dist) {
    print(row);
  }
}
