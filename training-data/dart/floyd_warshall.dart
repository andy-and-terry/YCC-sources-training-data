const int inf = 1 << 30;

List<List<int>> floydWarshall(int numNodes, List<List<int>> edges) {
  final dist = List.generate(numNodes, (i) => List.filled(numNodes, inf));
  for (var i = 0; i < numNodes; i++) {
    dist[i][i] = 0;
  }
  for (final edge in edges) {
    dist[edge[0]][edge[1]] = edge[2];
  }

  for (var k = 0; k < numNodes; k++) {
    for (var i = 0; i < numNodes; i++) {
      for (var j = 0; j < numNodes; j++) {
        if (dist[i][k] + dist[k][j] < dist[i][j]) {
          dist[i][j] = dist[i][k] + dist[k][j];
        }
      }
    }
  }

  return dist;
}

void main() {
  final edges = [
    [0, 1, 3],
    [0, 2, 8],
    [1, 2, 2],
    [2, 3, 1],
    [3, 0, 4],
  ];

  final dist = floydWarshall(4, edges);
  for (final row in dist) {
    print(row.join(' '));
  }
}
