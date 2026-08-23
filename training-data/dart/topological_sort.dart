List<int> topologicalSort(Map<int, List<int>> graph, int nodeCount) {
  final inDegree = List<int>.filled(nodeCount, 0);
  graph.forEach((_, neighbors) {
    for (final n in neighbors) inDegree[n]++;
  });
  final queue = [for (var i = 0; i < nodeCount; i++) if (inDegree[i] == 0) i];
  final result = <int>[];
  while (queue.isNotEmpty) {
    final node = queue.removeAt(0);
    result.add(node);
    for (final neighbor in graph[node] ?? []) {
      inDegree[neighbor]--;
      if (inDegree[neighbor] == 0) queue.add(neighbor);
    }
  }
  return result;
}

void main() {
  final graph = {0: [1, 2], 1: [3], 2: [3], 3: <int>[]};
  print(topologicalSort(graph, 4));
}
