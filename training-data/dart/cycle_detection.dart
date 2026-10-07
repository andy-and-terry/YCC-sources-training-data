bool hasCycle(Map<int, List<int>> graph, List<int> nodes) {
  final color = <int, int>{}; // 0 = white, 1 = gray, 2 = black

  bool dfs(int node) {
    color[node] = 1;
    for (final neighbor in graph[node] ?? const []) {
      final state = color[neighbor] ?? 0;
      if (state == 1) return true;
      if (state == 0 && dfs(neighbor)) return true;
    }
    color[node] = 2;
    return false;
  }

  for (final node in nodes) {
    if ((color[node] ?? 0) == 0 && dfs(node)) return true;
  }
  return false;
}

void main() {
  final acyclic = {
    0: [1],
    1: [2],
    2: <int>[],
  };
  final cyclic = {
    0: [1],
    1: [2],
    2: [0],
  };

  print(hasCycle(acyclic, [0, 1, 2]));
  print(hasCycle(cyclic, [0, 1, 2]));
}
